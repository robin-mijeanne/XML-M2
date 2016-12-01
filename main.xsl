<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output 
    method="html"
    encoding="UTF-8"
    doctype-public="-//W3C//DTD HTML 4.01//EN"
    doctype-system="http://www.w3.org/TR/html4/strict.dtd"
    indent="yes" />

    <xsl:template match="/">
        <html>
            <head>
                <title>Festival de cannes 2016</title>
                <link type="text/css" rel="stylesheet" href="style.css"/>
            </head>

            <body>
                <xsl:for-each select="//film">
                    <table border="1"><tr>
                    <xsl:call-template name="film">
                        <xsl:with-param name="film" select="." />
                    </xsl:call-template>
                    </tr></table>
                </xsl:for-each>

            </body>
        </html>
    </xsl:template>

    <xsl:template name="film">
        <xsl:param name="film"/>
        <table border="1">
            <th colspan="4">
                <h2 id="titre-film"><xsl:value-of select="$film/titre" /></h2>
            </th>
            <xsl:call-template name="afficherInfos">
                <xsl:with-param name="film" select="$film" />
            </xsl:call-template>

            <xsl:call-template name="afficherPrix">
                <xsl:with-param name="film" select="$film" />
            </xsl:call-template>

            <xsl:call-template name="afficherSynopsis">
                <xsl:with-param name="film" select="$film" />
            </xsl:call-template>

            <xsl:call-template name="afficherPersonnages">
                <xsl:with-param name="film" select="$film" />
            </xsl:call-template>
        </table>
    </xsl:template>

    <xsl:template name="afficherInfos">
        <xsl:param name="film"/>
        <tr>
            <td><h6>Année: <xsl:value-of select="$film/@annee_production" /></h6></td>
            <td><h6>Nationnalité realisateurs: <xsl:value-of select="$film/@pays" /></h6></td>
            <td><h6>Durée: <xsl:value-of select="$film/@duree" /></h6></td>
            <td><h6>Date de sortie: <xsl:value-of select="$film/@date_sortie" /></h6></td>
        </tr>
    </xsl:template>

    <xsl:template name="afficherPrix">
        <xsl:param name="film"/>
        <xsl:if test="count(//prix[attribution/@film=$film/@id]/@nom) != 0">
            <th colspan="4"  id="sous-rubrique">
                <h3>Prix: </h3>
            </th>
                <xsl:for-each select="//prix[attribution/@film=$film/@id]/@nom">
                   <tr><td colspan="4"> <xsl:value-of select="." /> </td></tr>
                </xsl:for-each>
        </xsl:if>
    </xsl:template>

    <xsl:template name="afficherSynopsis">
        <xsl:param name="film"/>
        <th colspan="4"  id="sous-rubrique">
                <h3>Synopsys: </h3>
        </th>
        <tr><td colspan="4"> <xsl:value-of select="$film/synopsis" /> </td></tr>
    </xsl:template>

    <xsl:template name="afficherPersonnages">
        <xsl:param name="film"/>
        <th colspan="4"  id="sous-rubrique">
                <h3>Personnages: </h3>
        </th>
        <xsl:for-each select="$film/personnages/personnage">
            <tr>
                <td colspan="2"> <xsl:value-of select="." /> </td>
                <td colspan="2">Incarné par: <xsl:value-of select="//artiste[@id=$personnage/@incarne_par]/nom" /></td>
            </tr>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
