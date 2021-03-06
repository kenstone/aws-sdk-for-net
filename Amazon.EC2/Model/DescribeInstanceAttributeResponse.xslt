<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ec2="http://ec2.amazonaws.com/doc/2012-04-01/" exclude-result-prefixes="ec2">
  <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>
  <xsl:variable name="ns" select="'http://ec2.amazonaws.com/doc/2012-04-01/'"/>
  <xsl:template match="ec2:DescribeInstanceAttributeResponse">
    <xsl:element name="DescribeInstanceAttributeResponse" namespace="{$ns}">
      <xsl:element name="ResponseMetadata" namespace="{$ns}">
        <xsl:element name="RequestId" namespace="{$ns}">
          <xsl:value-of select="ec2:requestId"/>
        </xsl:element>
      </xsl:element>
      <xsl:element name="DescribeInstanceAttributeResult" namespace="{$ns}">
        <xsl:element name="InstanceAttribute" namespace="{$ns}">
          <xsl:element name="InstanceId" namespace="{$ns}">
            <xsl:value-of select="ec2:instanceId"/>
          </xsl:element>
          <xsl:apply-templates select="ec2:instanceType"/>
          <xsl:apply-templates select="ec2:kernel"/>
          <xsl:apply-templates select="ec2:ramdisk"/>
          <xsl:apply-templates select="ec2:userData"/>
          <xsl:apply-templates select="ec2:disableApiTermination"/>
          <xsl:apply-templates select="ec2:instanceInitiatedShutdownBehavior"/>
          <xsl:apply-templates select="ec2:rootDeviceName"/>
          <xsl:apply-templates select="ec2:blockDeviceMapping"/>
          <xsl:apply-templates select="ec2:sourceDestCheck"/>
          <xsl:apply-templates select="ec2:groupSet"/>
          <xsl:apply-templates select="ec2:productCodes"/>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ec2:sourceDestCheck">
    <xsl:element name="SourceDestCheck" namespace="{$ns}">
      <xsl:value-of select="."/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ec2:groupSet">
    <xsl:for-each select="ec2:item">
      <xsl:element name="GroupName" namespace="{$ns}">
        <xsl:value-of select="ec2:groupName"/>
      </xsl:element>
      <xsl:element name="GroupId" namespace="{$ns}">
        <xsl:value-of select="ec2:groupId"/>
      </xsl:element>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="ec2:instanceType">
    <xsl:element name="InstanceType" namespace="{$ns}">
      <xsl:value-of select="ec2:value"/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="ec2:kernel">
    <xsl:element name="KernelId" namespace="{$ns}">
      <xsl:value-of select="ec2:value"/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="ec2:ramdisk">
    <xsl:element name="RamdiskId" namespace="{$ns}">
      <xsl:value-of select="ec2:value"/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="ec2:userData">
    <xsl:element name="UserData" namespace="{$ns}">
      <xsl:value-of select="ec2:value"/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="ec2:disableApiTermination">
    <xsl:element name="DisableApiTermination" namespace="{$ns}">
      <xsl:value-of select="ec2:value"/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="ec2:instanceInitiatedShutdownBehavior">
    <xsl:element name="InstanceInitiatedShutdownBehavior" namespace="{$ns}">
      <xsl:value-of select="ec2:value"/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="ec2:rootDeviceName">
    <xsl:element name="RootDeviceName" namespace="{$ns}">
      <xsl:value-of select="ec2:value"/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="ec2:blockDeviceMapping">
    <xsl:for-each select="ec2:item">
      <xsl:element name="BlockDeviceMapping" namespace="{$ns}">
        <xsl:element name="DeviceName" namespace="{$ns}">
          <xsl:value-of select="ec2:deviceName"/>
        </xsl:element>
        <xsl:apply-templates select="ec2:ebs"/>
      </xsl:element>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="ec2:ebs">
    <xsl:element name="Ebs" namespace="{$ns}">
      <xsl:element name="VolumeId" namespace="{$ns}">
        <xsl:value-of select="ec2:volumeId"/>
      </xsl:element>
      <xsl:element name="Status" namespace="{$ns}">
        <xsl:value-of select="ec2:status"/>
      </xsl:element>
      <xsl:element name="AttachTime" namespace="{$ns}">
        <xsl:value-of select="ec2:attachTime"/>
      </xsl:element>
      <xsl:element name="DeleteOnTermination" namespace="{$ns}">
        <xsl:if test="string-length(ec2:deleteOnTermination) = 0">false</xsl:if>
        <xsl:if test="string-length(ec2:deleteOnTermination) > 0">
          <xsl:value-of select="ec2:deleteOnTermination"/>
        </xsl:if>
      </xsl:element>
    </xsl:element>
  </xsl:template>
  <xsl:template match="ec2:productCodes">
    <xsl:for-each select="ec2:item">
      <xsl:element name="ProductCodes" namespace="{$ns}">
        <xsl:element name="ProductCodeId" namespace="{$ns}">
          <xsl:value-of select="ec2:productCode"/>
        </xsl:element>
        <xsl:element name="Type" namespace="{$ns}">
          <xsl:value-of select="ec2:type"/>
        </xsl:element>
      </xsl:element>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
