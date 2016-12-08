(:: pragma bea:global-element-parameter parameter="$parametrosVerificaCreditoExterno" element="ns2:parametrosVerificaCreditoExterno" location="../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)
(:: pragma bea:global-element-return element="ns1:ParametrosSerasa" location="../Interfaces/Schemas/Serasa.xsd" ::)

declare namespace ns2 = "http://pucminas.br/SN/Credito";
declare namespace ns1 = "http://serasa.com.br/SN/Serasa";
declare namespace ns0 = "http://pucminas.br/MC/SOA/RenatoRibeiro";
declare namespace xf = "http://tempuri.org/OSB_RenatoRibeiro/ServiciosNegocio/Credito/Resources/Transformations/VerificaCreditoExternoToSerasa/";

declare function xf:VerificaCreditoExternoToSerasa($parametrosVerificaCreditoExterno as element(ns2:parametrosVerificaCreditoExterno))
    as element(ns1:ParametrosSerasa) {
        <ns1:ParametrosSerasa>
            <ns1:num_documento>{ data($parametrosVerificaCreditoExterno/ns2:pessoa/ns0:cnpj) }</ns1:num_documento>
            <ns1:dt_nascimento>{ data($parametrosVerificaCreditoExterno/ns2:pessoa/ns0:dataNascimento) }</ns1:dt_nascimento>
            <ns1:dt_solicitacao>{ fn:current-date() }</ns1:dt_solicitacao>
        </ns1:ParametrosSerasa>
};

declare variable $parametrosVerificaCreditoExterno as element(ns2:parametrosVerificaCreditoExterno) external;

xf:VerificaCreditoExternoToSerasa($parametrosVerificaCreditoExterno)
