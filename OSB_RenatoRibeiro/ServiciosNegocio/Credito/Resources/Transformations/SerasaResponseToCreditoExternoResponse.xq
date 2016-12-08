(:: pragma bea:global-element-parameter parameter="$resultadoSerasa" element="ns1:ResultadoSerasa" location="../Interfaces/Schemas/Serasa.xsd" ::)
(:: pragma bea:global-element-return element="ns2:resultadoVerificaCreditoExterno" location="../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)

declare namespace ns2 = "http://pucminas.br/SN/Credito";
declare namespace ns1 = "http://serasa.com.br/SN/Serasa";
declare namespace ns0 = "http://pucminas.br/MC/SOA/RenatoRibeiro";
declare namespace xf = "http://tempuri.org/OSB_RenatoRibeiro/ServiciosNegocio/Credito/Resources/Transformations/SerasaToCreditoExterno/";

declare function xf:SerasaToCreditoExterno($resultadoSerasa as element(ns1:ResultadoSerasa))
    as element(ns2:resultadoVerificaCreditoExterno) {
        <ns2:resultadoVerificaCreditoExterno>
            <ns2:credito>
                <ns0:pessoa>
                    <ns0:cnpj>{ data($resultadoSerasa/ns1:num_documento) }</ns0:cnpj>
                </ns0:pessoa>
            </ns2:credito>
            <ns2:valorRestricao>{ fn:number($resultadoSerasa/ns1:valor_restricao) }</ns2:valorRestricao>
        </ns2:resultadoVerificaCreditoExterno>
};

declare variable $resultadoSerasa as element(ns1:ResultadoSerasa) external;

xf:SerasaToCreditoExterno($resultadoSerasa)
