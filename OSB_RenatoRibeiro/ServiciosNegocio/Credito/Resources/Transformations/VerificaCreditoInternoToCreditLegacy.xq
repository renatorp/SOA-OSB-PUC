(:: pragma bea:global-element-parameter parameter="$parametrosVerificaCreditoInterno" element="ns2:parametrosVerificaCreditoInterno" location="../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)
(:: pragma bea:global-element-return element="ns1:ParametrosCreditLegacy" location="../Interfaces/Schemas/CreditLegacy.xsd" ::)

declare namespace ns2 = "http://pucminas.br/SN/Credito";
declare namespace ns1 = "http://creditlegacy.com.br/SN/CreditLegacy";
declare namespace ns0 = "http://pucminas.br/MC/SOA/RenatoRibeiro";
declare namespace xf = "http://tempuri.org/OSB_RenatoRibeiro/ServiciosNegocio/Credito/Resources/Transformations/VerificaCreditoInternoToCreditLegacy/";

declare function xf:VerificaCreditoInternoToCreditLegacy($parametrosVerificaCreditoInterno as element(ns2:parametrosVerificaCreditoInterno))
    as element(ns1:ParametrosCreditLegacy) {
        <ns1:ParametrosCreditLegacy>
            <ns1:cpf>{ data($parametrosVerificaCreditoInterno/ns2:pessoa/ns0:cnpj) }</ns1:cpf>
            <ns1:dt_solicitacao>{ fn:current-date() }</ns1:dt_solicitacao>
        </ns1:ParametrosCreditLegacy>
};

declare variable $parametrosVerificaCreditoInterno as element(ns2:parametrosVerificaCreditoInterno) external;

xf:VerificaCreditoInternoToCreditLegacy($parametrosVerificaCreditoInterno)
