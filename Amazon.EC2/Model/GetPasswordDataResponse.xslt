<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ec2="http://ec2.amazonaws.com/doc/2012-04-01/" exclude-result-prefixes="ec2">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>
    <xsl:variable name="ns" select="'http://ec2.amazonaws.com/doc/2012-04-01/'"/>
    <xsl:template match="ec2:GetPasswordDataResponse">
        <xsl:element name="GetPasswordDataResponse" namespace="{$ns}">
            <xsl:element name="ResponseMetadata" namespace="{$ns}">
                <xsl:element name="RequestId" namespace="{$ns}">
                    <xsl:value-of select="ec2:requestId"/>
                </xsl:element>
            </xsl:element>
            <xsl:element name="GetPasswordDataResult" namespace="{$ns}">
                <xsl:element name="PasswordData" namespace="{$ns}">
                    <xsl:element name="InstanceId" namespace="{$ns}">
                        <xsl:value-of select="ec2:instanceId"/>
                    </xsl:element>
                    <xsl:element name="Timestamp" namespace="{$ns}">
                        <xsl:value-of select="ec2:timestamp"/>
                    </xsl:element>
                    <xsl:element name="Data" namespace="{$ns}">
                        <xsl:value-of select="ec2:passwordData"/>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
