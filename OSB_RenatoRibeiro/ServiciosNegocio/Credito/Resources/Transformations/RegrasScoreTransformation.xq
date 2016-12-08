(:: pragma bea:local-element-parameter parameter="$pessoa" type="ns1:resultadoVerificaCreditoGeral/ns1:pessoa" location="../../../../EBS/Credito/xsd/ParametrosCreditoGeral.xsd" ::)
(:: pragma bea:global-element-return element="ns1:resultadoVerificaCreditoGeral" location="../../../../EBS/Credito/xsd/ParametrosCreditoGeral.xsd" ::)

declare namespace ns1 = "http://pucminas.br/SN/CreditoGeral";
declare namespace ns0 = "http://pucminas.br/MC/SOA/RenatoRibeiro";
declare namespace xf = "http://tempuri.org/OSB_RenatoRibeiro/ServiciosNegocio/Credito/Resources/Transformations/RegrasScoreTransformation/";

declare function xf:RegrasScoreTransformation($creditoExterno as xs:decimal,
    $somaCreditoInterno as xs:decimal,
    $numRestricoesCreditoInterno as xs:decimal,
    $indicaWhiteLilst as xs:boolean,
    $pessoa as element())
    as element(ns1:resultadoVerificaCreditoGeral) {
        <ns1:resultadoVerificaCreditoGeral>
            <ns1:score>
                {
                    if ($creditoExterno > 400) then
                        (200)
                    else 
                        if (($numRestricoesCreditoInterno <= 3 and $somaCreditoInterno < 200)) then
                            (500)
                        else 
                            if (($somaCreditoInterno > 200 and $indicaWhiteLilst)) then
                                (900)
                            else 
                                if ($numRestricoesCreditoInterno > 4) then
                                    (0)
                                else 
                                    ""
                }
</ns1:score>
            <ns1:pessoa>{ $pessoa/@* , $pessoa/node() }</ns1:pessoa>
        </ns1:resultadoVerificaCreditoGeral>
};

declare variable $creditoExterno as xs:decimal external;
declare variable $somaCreditoInterno as xs:decimal external;
declare variable $numRestricoesCreditoInterno as xs:decimal external;
declare variable $indicaWhiteLilst as xs:boolean external;
declare variable $pessoa as element() external;

xf:RegrasScoreTransformation($creditoExterno,
    $somaCreditoInterno,
    $numRestricoesCreditoInterno,
    $indicaWhiteLilst,
    $pessoa)
