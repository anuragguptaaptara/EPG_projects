<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="3.0">
    
    <xsl:output indent="yes" method="html"/>
    
    <xsl:template match="/">
        <xsl:variable name="collectionPath" select="substring-before(base-uri(),tokenize(base-uri(),'/')[last()])"/>
        <xsl:result-document href="{$collectionPath}/output_folder/output_file.xml" method="html">
            <html>
                <table>
                    <tr>
                        <th>File Name</th>
                        <th>Total Word Counts</th>
                        <th>Unique Word Count</th>
                        <th>Duplicate Word Count</th>
                    </tr>
                    
                    <xsl:for-each select="collection(concat(substring-before(base-uri(),tokenize(base-uri(),'/')[last()]),'?select=*.html;recurse=yes'))">
                    <xsl:variable name="all_count">
                        <root>
                            <total>
                                <xsl:variable name="count_w">
                                    <xsl:apply-templates select="//text()"/>
                                </xsl:variable>
                                <xsl:variable name="apos" select='"&apos;"'/>
<!--                                <xsl:variable name="apos">'</xsl:variable>-->
                                <!--                                <xsl:variable name="apos" select="'"/> apos; -->
                                
<!--                                <xsl:variable name="languagelist">
                                    <xsl:apply-templates select="//text()"/>
                                </xsl:variable>
                                
                                <xsl:value-of select="string-length($languagelist) - string-length(translate($languagelist, ' ', ''))" />-->
                                
    <!--                            <xsl:value-of select="string-length(normalize-space(//text())) 
                                    - 
                                    string-length(translate(normalize-space(//text()),' ','')) +1"></xsl:value-of>
   -->                             
                                <xsl:value-of select="count(
                                    for $w in //text()/tokenize(normalize-space(.), ' ')[.!=''] return count($w))">
                                </xsl:value-of>
                                <!--<xsl:value-of select="count(
                                    for $w in //text()/tokenize(., '\W+')[.!=''] return count(lower-case($w)))">
                                </xsl:value-of>-->
                            </total>
                            <unique>
                                <xsl:for-each-group group-by="." select="
                                    for $w in //text()/tokenize(normalize-space(.), ' ')[.!=''] return $w">
                                    <xsl:sort select="count(current-group())" order="descending"/>
                                    <td word="{current-grouping-key()}" frequency="{count(distinct-values(current-group()))}"/>
                                </xsl:for-each-group>
                            </unique>
                            
                            <duplicate1>
                                
                                <xsl:variable name="ooo">
                                <xsl:value-of select="count(
                                    for $w in //text()/tokenize(normalize-space(.), ' ')[.!=''] return $w)">
                                </xsl:value-of>
                                </xsl:variable>
                                <xsl:value-of select="$ooo[index-of($ooo,.)[last()[. gt 1]]]"></xsl:value-of>
                            </duplicate1>
                         
                            <duplicate>
                                <xsl:for-each-group group-by="." select="
                                    for $w in //text()/tokenize(normalize-space(.), ' ')[.!=''] return $w">
                                    <xsl:sort select="count(current-group())" order="descending"/>
                                    <td word="{current-grouping-key()}" frequency="{count(current-group())}"/>
                                </xsl:for-each-group>
                            </duplicate>
                        </root>
                    </xsl:variable>
                <tr>
                    <td>
                        <xsl:value-of select="base-uri()"></xsl:value-of>
                    </td>
                    <td>
                        <xsl:value-of select="$all_count/root/total"></xsl:value-of>
                    </td>
                    <td>
                        <xsl:value-of select="count($all_count/root/unique/td)"></xsl:value-of>
                    </td>
                    <td>
<!--                        <oooo>

                            <xsl:value-of select="$all_count/root/total - count($all_count/root/unique/td)"></xsl:value-of>
                        </oooo>
-->
                        <xsl:value-of select="$all_count/root/total - count($all_count/root/unique/td)"></xsl:value-of>
<!--                        <xsl:value-of select="count($all_count/root/duplicate/td[@frequency &gt; 1])"></xsl:value-of>-->
                    </td>
                </tr>
                
<!--                        <td file_name="{tokenize(base-uri(),'/')[last()]}" total_word="{$all_count/root/total}" unique="{count($all_count/root/unique/td[@frequency='1'])}" duplicate="{count($all_count/root/unique/td[@frequency &gt; 1])}"></td>-->
        </xsl:for-each>
            </table>
        </html>
<!--   
                <html>
            <xsl:variable name="all_count">
                <root>
                    <total>
                        <xsl:variable name="count_w">
                            <xsl:apply-templates select="//text()"/>
                        </xsl:variable>
                        <xsl:value-of select="count(
                            for $w in //text()/tokenize(., '\W+')[.!=''] return count(lower-case($w)))">
                        </xsl:value-of>
                    </total>
                    <unique>
                        <xsl:for-each-group group-by="." select="
                            for $w in //text()/tokenize(., '\W+')[.!=''] return lower-case($w)">
                            <xsl:sort select="count(current-group())" order="descending"/>
                            <td word="{current-grouping-key()}" frequency="{count(current-group())}"/>
                        </xsl:for-each-group>
                    </unique>
                </root>
            </xsl:variable>
            <table>
                <td file_name="{tokenize(base-uri(),'/')[last()]}" total_word="{$all_count/root/total}" unique="{count($all_count/root/unique/td[@frequency='1'])}" duplicate="{count($all_count/root/unique/td[@frequency &gt; 1])}"></td>
            </table>
        </html>
            -->

        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>