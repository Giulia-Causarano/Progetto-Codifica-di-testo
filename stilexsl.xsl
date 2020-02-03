<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </title>
                <link rel="stylesheet" type="text/css" href="stilecss.css" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                <script type="text/javascript" src="jquery.js"></script>
            </head>
            <body>
                <xsl:element name="div">
                    <xsl:attribute name="class">titolo</xsl:attribute>
                    <h1>
                        <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                    </h1>
                </xsl:element>
                <div id="prefazione">
                    <p>
                        Il sito è stato realizzato per la rappresentazione e codifica digitale di due cartoline provenienti dal <strong><i><xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:repository"/></i></strong>,
                        situato presso il <strong><i><xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt[2]/tei:name" /></i></strong> e si riconduce a un progetto avviato dal <a href="http://www.labcd.unipi.it/"><xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:address/tei:addrLine[1]" /></a>.
                    </p>
                </div>
                <br /> <br />
                <div id="main">
                    <div id="imgpiccole1">
                        <xsl:element name="a">
                            <xsl:attribute name="href">#contenitore1</xsl:attribute>
                        <xsl:element name="img">
                            <xsl:attribute name="src">
                                <xsl:value-of select="tei:teiCorpus/tei:TEI/tei:facsimile/tei:surfaceGrp/tei:surface[@type='fronte003']/tei:graphic/@url"/>
                            </xsl:attribute>
                            <xsl:attribute name="class">img1</xsl:attribute>
                        </xsl:element>
                        </xsl:element>
                    </div>
                    <div id="imgpiccole2">
                        <xsl:element name="a">
                            <xsl:attribute name="href">#contenitore2</xsl:attribute>
                        <xsl:element name="img">
                            <xsl:attribute name="src">
                                <xsl:value-of select="tei:teiCorpus/tei:TEI/tei:facsimile/tei:surfaceGrp/tei:surface[@type='fronte015']/tei:graphic/@url"/>
                            </xsl:attribute>
                            <xsl:attribute name="class">img2</xsl:attribute>
                        </xsl:element>
                        </xsl:element>
                    </div>
                </div>
                <br /> <br /> <br />
                <div id="contenitore1">
                    <xsl:apply-templates select="tei:teiCorpus/tei:TEI[1]" />
                </div>
                <div id="contenitore2">
                    <xsl:apply-templates select="tei:teiCorpus/tei:TEI[2]" />
                </div>
                <br /> <br /> <br /> <br />
                <div id="footer">
                    <xsl:apply-templates select="tei:teiCorpus/tei:teiHeader/tei:fileDesc" />
                </div>
            </body>
        </html>
    </xsl:template>
    
   <!--template da applicare alla prima cartolina--> 
    <xsl:template match="tei:teiCorpus/tei:TEI[1]">
        <xsl:element name="h2">
            <xsl:attribute name="class"> titolo1 </xsl:attribute>
            "<xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl/tei:title" />"
        </xsl:element>
        <br /> 
        <xsl:element name="img">
            <xsl:attribute name="src"> 
                <xsl:value-of select="tei:facsimile/tei:surfaceGrp/tei:surface[1]/tei:graphic/@url"/>
            </xsl:attribute>
            <xsl:attribute name="id">img1F</xsl:attribute>
        </xsl:element>
        <div id="fronte_cart1">
            <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc" />
            <xsl:apply-templates select="tei:text/tei:front/tei:figure" />
            <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc" />
            <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson" />
            <xsl:apply-templates select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[1]" />
            <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPlace" />
            <xsl:apply-templates select="tei:teiHeader/tei:profileDesc/tei:langUsage" />
        </div>
        <br /> <br /> <br />
        <xsl:element name="img">
            <xsl:attribute name="src">
                <xsl:value-of select="tei:facsimile/tei:surfaceGrp/tei:surface[2]/tei:graphic/@url"/>
            </xsl:attribute>
            <xsl:attribute name="id">img1R</xsl:attribute>
            <xsl:attribute name="usemap">#img-map</xsl:attribute>
        </xsl:element>
        <xsl:element name="map">
            <xsl:attribute name="name">img-map</xsl:attribute>
            <xsl:for-each select="tei:facsimile/tei:surfaceGrp/tei:surface[2]/tei:zone">
                <xsl:element name="area">
                    <xsl:attribute name="shape">rect</xsl:attribute>
                    <xsl:attribute name="coords">
                        <xsl:value-of select="@ulx"/>,<xsl:value-of select="@uly"/>,<xsl:value-of select="@lrx"/>,<xsl:value-of select="@lry"/>
                    </xsl:attribute>
                    <xsl:attribute name="onmouseover">punt(<xsl:value-of select="@xml:id"/>);</xsl:attribute>
                    <xsl:attribute name="onmouseout">puntatore(<xsl:value-of select="@xml:id"/>);</xsl:attribute>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
        <div id="retro_cart1">
            <xsl:apply-templates select="tei:text/tei:body/tei:div/tei:div[@type='message']" />
            <div id="info1">
                <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:handDesc/tei:handNote/tei:p" />
                <xsl:apply-templates select="tei:text/tei:body/tei:div/tei:div[@type='destination']/tei:p/tei:stamp[@type='postmark']" />
                <xsl:apply-templates select="tei:text/tei:body/tei:div/tei:div[@type='destination']/tei:p/tei:stamp[@type='postage']" />
                <xsl:apply-templates select="tei:text/tei:body/tei:div/tei:div[@type='stampe']/tei:ab" />
            </div>
        </div>
        <br /> <br /> <br />
    </xsl:template>
    
    <!--template da applicare alla seconda cartolina-->
    <xsl:template match="tei:teiCorpus/tei:TEI[2]">
        <xsl:element name="h2">
            <xsl:attribute name="class"> titolo2 </xsl:attribute>
            "<xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl/tei:title" />"
        </xsl:element>
        <br /> 
        <xsl:element name="img">
            <xsl:attribute name="src"> 
                <xsl:value-of select="tei:facsimile/tei:surfaceGrp/tei:surface[1]/tei:graphic/@url"/>
            </xsl:attribute>
            <xsl:attribute name="id">img2F</xsl:attribute>
        </xsl:element>
        <div id="fronte_cart2">
            <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc" />
            <xsl:apply-templates select="tei:text/tei:front/tei:figure" />
            <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc" />
            <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson" />
            <xsl:apply-templates select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[1]" />
            <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPlace" />
            <xsl:apply-templates select="tei:teiHeader/tei:profileDesc/tei:langUsage" />
        </div>
        <br /> <br /> <br />
        <xsl:element name="img">
            <xsl:attribute name="src">
                <xsl:value-of select="tei:facsimile/tei:surfaceGrp/tei:surface[2]/tei:graphic/@url"/>
            </xsl:attribute>
            <xsl:attribute name="id">img2R</xsl:attribute>
            <xsl:attribute name="usemap">#img2-map</xsl:attribute>
        </xsl:element>
        <xsl:element name="map">
            <xsl:attribute name="name">img2-map</xsl:attribute>
            <xsl:for-each select="tei:facsimile/tei:surfaceGrp/tei:surface[2]/tei:zone">
                <xsl:element name="area">
                    <xsl:attribute name="shape">rect</xsl:attribute>
                    <xsl:attribute name="coords">
                        <xsl:value-of select="@ulx"/>,<xsl:value-of select="@uly"/>,<xsl:value-of select="@lrx"/>,<xsl:value-of select="@lry"/>
                    </xsl:attribute>
                    <xsl:attribute name="onmouseover">punt(<xsl:value-of select="@xml:id"/>);</xsl:attribute>
                    <xsl:attribute name="onmouseout">puntatore(<xsl:value-of select="@xml:id"/>);</xsl:attribute>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
        <div id="retro_cart2">
            <xsl:apply-templates select="tei:text/tei:body/tei:div/tei:div[@type='message']" />
            <div id="info2">
                <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:handDesc/tei:handNote/tei:p" />
                <xsl:apply-templates select="tei:text/tei:body/tei:div/tei:div[@type='destination']/tei:p/tei:stamp[@type='postmark']" />
                <xsl:apply-templates select="tei:text/tei:body/tei:div/tei:div[@type='destination']/tei:p/tei:stamp[@type='postage']" />
                <xsl:apply-templates select="tei:text/tei:body/tei:div/tei:div[@type='stampe']/tei:ab" />
            </div>
        </div>
        <br /> <br /> <br />
    </xsl:template>
    
    <!--template descrizione fronte-->
    <xsl:template match="tei:teiHeader/tei:fileDesc/tei:sourceDesc">
        <xsl:element name="p">
            <strong>Autore:</strong> <xsl:value-of select="tei:bibl/tei:author"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:text/tei:front/tei:figure">
        <xsl:element name="p">
            <strong>Descrizione:</strong> <xsl:value-of select="tei:figDesc"/>
        </xsl:element>
        <xsl:if test="tei:note/@n='1'">
            <xsl:element name="p">
                <strong>Note:</strong><xsl:value-of select="tei:note"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc">
        <xsl:element name="p">
            <strong>Numero di inventario:</strong> <xsl:value-of select="tei:msIdentifier/tei:idno"/>
        </xsl:element>
        <xsl:element name="p">
            <strong>Altezza:</strong> <xsl:value-of select="tei:physDesc/tei:objectDesc/tei:supportDesc/tei:support/tei:dimensions/tei:height"/>cm
        </xsl:element>
        <xsl:element name="p">
            <strong>Larghezza:</strong> <xsl:value-of select="tei:physDesc/tei:objectDesc/tei:supportDesc/tei:support/tei:dimensions/tei:width"/>cm
        </xsl:element>
        <xsl:element name="p">
            <strong>Stato di conservazione:</strong> <xsl:value-of select="tei:physDesc/tei:objectDesc/tei:supportDesc/tei:condition" />
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson">
        <xsl:element name="p">
            <strong>Mittente:</strong> <xsl:value-of select="tei:person[1]/tei:persName"/>, <xsl:value-of select="tei:person[1]/tei:occupation"/>
        </xsl:element>
        <xsl:element name="p">
            <strong>Destinatario:</strong> <xsl:value-of select="tei:person[2]/tei:persName"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPlace">
        <xsl:element name="p">
            <strong>Inviata da:</strong> <xsl:value-of select="tei:place[2]/tei:placeName"/>
        </xsl:element>
        <xsl:element name="p">
            <strong>Ricevuta a:</strong> <xsl:value-of select="tei:place[1]/tei:placeName"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[1]">
        <xsl:element name="p">
            <strong>Data di invio:</strong> <xsl:value-of select="tei:date"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:teiHeader/tei:profileDesc/tei:langUsage">
        <xsl:element name="p">
            <strong>Lingua usata nel testo:</strong> <xsl:value-of select="tei:language[1]"/>
        </xsl:element>
        <xsl:element name="p">
            <strong>Lingue secondarie presenti nella cartolina:</strong><br />
            <xsl:value-of select="tei:language[2]"/> <br />
            <xsl:value-of select="tei:language[3]"/> <br />
            <xsl:value-of select="tei:language[4]"/> <br />
            <xsl:value-of select="tei:language[5]"/> <br />
            <xsl:value-of select="tei:language[6]"/> <br />
        </xsl:element>
    </xsl:template>
    
    <!--template trascrizione testo-->
    <xsl:template match="//tei:lb">
        <br />
        <xsl:element name="p">
            <xsl:attribute name="id">
                <xsl:value-of select="translate(@facs,' # ','')"/>
            </xsl:attribute>
            <xsl:attribute name="class">punt</xsl:attribute>
            <img src="punt.png"></img>
        </xsl:element>
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="tei:text/tei:body/tei:div/tei:div[@type='message']">
        <xsl:element name="div">
            <xsl:attribute name="class">messaggio</xsl:attribute>
            <xsl:element name="h3">
                <strong>Trascrizione testo:</strong>
            </xsl:element>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:ab">
        <xsl:element name="div">
            <xsl:attribute name="id">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:address">
        <address class="indirizzo">
            <xsl:apply-templates />
        </address>
    </xsl:template>
    
    <xsl:template match="tei:closer">
        <xsl:element name="div">
            <xsl:attribute name="id">
                <xsl:value-of select="tei:lb/@xml:id"/>
            </xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend='underline']">
        <i><u>
            <xsl:apply-templates />
        </u></i>
    </xsl:template>
    
    <!--template elementi retro-->
    <xsl:template match="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:handDesc/tei:handNote/tei:p">
        <xsl:element name="p">
            <xsl:attribute name="id">
                <xsl:value-of select="translate(@facs,'#','')"/>
            </xsl:attribute>
            <xsl:attribute name="class">punt</xsl:attribute>
            <img src="punt.png"></img>
        </xsl:element>
        <xsl:element name="p">
            <strong>Note:</strong><xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:text/tei:body/tei:div/tei:div[@type='destination']/tei:p/tei:stamp[@type='postmark']">
        <xsl:element name="p">
            <xsl:attribute name="id">
                <xsl:value-of select="translate(@facs,'#','')"/>
            </xsl:attribute>
            <xsl:attribute name="class">punt</xsl:attribute>
            <img src="punt.png"></img>
        </xsl:element>
        <xsl:element name="p">
            <strong>Timbro postale:</strong>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:text/tei:body/tei:div/tei:div[@type='destination']/tei:p/tei:stamp[@type='postage']">
        <xsl:element name="p">
            <xsl:attribute name="id">
                <xsl:value-of select="translate(@facs,'#','')"/>
            </xsl:attribute>
            <xsl:attribute name="class">punt</xsl:attribute>
            <img src="punt.png"></img>
        </xsl:element>
        <xsl:element name="p">
            <strong>Francobollo:</strong>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:text/tei:body/tei:div/tei:div[@type='stampe']/tei:ab">
        <br />
        <xsl:element name="div">
           <strong>Stampe già presenti nella cartolina:</strong><br />
                <xsl:for-each select="tei:s">
                    <xsl:element name="p">
                        <xsl:value-of select="."/>
                    </xsl:element>
                </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    <!--template footer-->
    <xsl:template match="tei:teiCorpus/tei:teiHeader/tei:fileDesc">
        <div id="conclusione">
            <div id="crediti">
            <h2> Crediti </h2>
                <xsl:element name="p">
                Compilatore: <xsl:value-of select="tei:editionStmt/tei:respStmt[2]/tei:name" /> 
                <br />
                Responsabile scientifico: <xsl:value-of select="tei:editionStmt/tei:respStmt[3]/tei:name" />
                <br />
                Funzionario responsabile: <xsl:value-of select="tei:editionStmt/tei:respStmt[4]/tei:name"/>
                <br />  
                Ente di appartenenza: <xsl:value-of select="tei:titleStmt/tei:respStmt[2]/tei:name" />
                </xsl:element>
            </div>
            <div id="about">
            <h2> About </h2>
            <p> Trascrizione e codifica a cura di: <xsl:value-of select="tei:titleStmt/tei:respStmt[1]/tei:name" />
                <br />
                Il progetto è stato realizzato per l'esame di <strong>Codifica di testo</strong> (a.a 2019-2020) del professore Angelo Mario del Grosso,<strong>Università di Pisa</strong>
            </p>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>