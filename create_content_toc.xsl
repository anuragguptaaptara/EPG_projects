<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xhtml="http://www.w3.org/1999/xhtml" 
    exclude-result-prefixes="xs xhtml"
    version="3.0">
 
 <xsl:output method="text"/>
 
    <xsl:template match="/">
        <xsl:variable name="xhtmlPath" select="concat(substring-before(base-uri(),'/xhtml'),'/xhtml')"/>
        <xsl:variable name="fontsPath" select="concat(substring-before(base-uri(),'/xhtml'),'/fonts')"/>
        <xsl:variable name="cssPath" select="concat(substring-before(base-uri(),'/xhtml'),'/styles')"/>
        <xsl:variable name="imagesPath" select="concat(substring-before(base-uri(),'/xhtml'),'/images')"/>
            <html>
                
               <!-- <xhtml>
                    <xsl:for-each select="collection(concat($xhtmlPath,'?select=*.*'))" >
                        <xsl:element name='file'>
                            <xsl:value-of select="tokenize(document-uri(.), '/')[last()]"/>
                        </xsl:element>
                    </xsl:for-each>
                </xhtml>
               --> 
                <fonts>
                <xsl:for-each select="collection(concat($fontsPath,'?select=*.*'))" >
                    <xsl:element name='file'>
                        <xsl:value-of select="tokenize(document-uri(.), '/')[last()]"/>
                    </xsl:element>
                </xsl:for-each>
                </fonts>
               
            <!--    <css>
                <xsl:for-each select="collection(concat($cssPath,'?select=*.*'))" >
                    <xsl:element name='file'>
                        <xsl:value-of select="tokenize(document-uri(.), '/')[last()]"/>
                    </xsl:element>
                </xsl:for-each>
                </css>
            -->    
               <!-- <images>
                    <xsl:for-each select="collection(concat($imagesPath,'?select=*.*'))" >
                        <xsl:element name='file'>
                            <xsl:value-of select="tokenize(document-uri(.), '/')[last()]"/>
                        </xsl:element>
                    </xsl:for-each>
                </images>
            -->
            </html>
    </xsl:template>
    
    
    
    
    
    
    
    
    <!--<xsl:template match="xhtml:toc">
        <xsl:variable name="path" select="substring-before(base-uri(), '/xhtml')"/>
        
        <oooo>
            <xsl:value-of select="$path"></xsl:value-of>
        </oooo>
        
        
        
        
        
        
        
        
    </xsl:template>-->
    
    
    
    
    
    
    
    
    
</xsl:stylesheet>