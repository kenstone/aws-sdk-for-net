<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ec2="http://ec2.amazonaws.com/doc/2012-04-01/" exclude-result-prefixes="ec2">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>
    <xsl:variable name="ns" select="'http://ec2.amazonaws.com/doc/2012-04-01/'"/>
    <xsl:template match="ec2:DescribeAddressesResponse">
        <xsl:element name="DescribeAddressesResponse" namespace="{$ns}">
            <xsl:element name="ResponseMetadata" namespace="{$ns}">
                <xsl:element name="RequestId" namespace="{$ns}">
                    <xsl:value-of select="ec2:requestId"/>
                </xsl:element>
            </xsl:element>
            <xsl:element name="DescribeAddressesResult" namespace="{$ns}">
                <xsl:apply-templates select="ec2:addressesSet"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match="ec2:addressesSet">
        <xsl:apply-templates select="ec2:item"/>
    </xsl:template>
    <xsl:template match="ec2:item">
        <xsl:element name="Address" namespace="{$ns}">
            <xsl:element name="InstanceId" namespace="{$ns}">
                <xsl:value-of select="ec2:instanceId"/>
            </xsl:element>
            <xsl:element name="PublicIp" namespace="{$ns}">
                <xsl:value-of select="ec2:publicIp"/>
            </xsl:element>
          <xsl:element name="AllocationId" namespace="{$ns}">
            <xsl:value-of select="ec2:allocationId"/>
          </xsl:element>
          <xsl:element name="AssociationId" namespace="{$ns}">
            <xsl:value-of select="ec2:associationId"/>
          </xsl:element>
          <xsl:element name="Domain" namespace="{$ns}">
            <xsl:value-of select="ec2:domain"/>
          </xsl:element>
          <xsl:element name="NetworkInterfaceId" namespace="{$ns}">
            <xsl:value-of select="ec2:networkInterfaceId"/>
          </xsl:element>
          <xsl:element name="NetworkInterfaceOwnerId" namespace="{$ns}">
            <xsl:value-of select="ec2:networkInterfaceOwnerId"/>
          </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
