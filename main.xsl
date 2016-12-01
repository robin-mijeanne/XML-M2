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
                    <table border="1">
                        <th colspan="4">
                        <h1 id="titre-film">FILMS</h1></th>
                        <xsl:for-each select="//film">


                            <tr>
                                <xsl:call-template name="film">
                                    <xsl:with-param name="film" select="." />
                                </xsl:call-template>
                            </tr>
                        </xsl:for-each>
                    </table>

                    <table border="1">
                        <th colspan="4">
                            <h1 id="titre-film">JURY</h1>
                        </th>
                        <xsl:for-each select="//membre">
                            <tr>
                                <td>
                                    <xsl:call-template name="afficherMembreJury">
                                        <xsl:with-param name="membre" select="." />
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>

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
                <h3>Acteurs: </h3>
            </th>
            <xsl:for-each select="$film/personnages/personnage">
                <tr>
                    <td colspan="2">
                        <xsl:call-template name="afficherArtiste">
                            <xsl:with-param name="personnage" select="." />
                        </xsl:call-template>
                    </td>
                    <td colspan="2">Incarne: <xsl:value-of select="." /> </td>
                </tr>
            </xsl:for-each>
        </xsl:template>

        <xsl:template name="afficherArtiste">
            <xsl:param name="personnage"/>
            <h4><xsl:value-of select="//artiste[@id=$personnage/@incarne_par]/nom" /> &#160; <xsl:value-of select="//artiste[@id=$personnage/@incarne_par]/prenom" /> </h4>
            <h5>Sexe: <xsl:value-of select="//artiste[@id=$personnage/@incarne_par]/@sexe" /></h5>
        </xsl:template>

        <xsl:template name="afficherMembreJury">
            <xsl:param name="membre"/>
            <h4>
                <xsl:value-of select="//artiste[@id=$membre/@artiste]/nom" /> &#160; 
                <xsl:value-of select="//artiste[@id=$membre/@artiste]/prenom" /> &#160;
            </h4>
            <xsl:if test="count($membre/@role) != 0">
                <h4><xsl:value-of select="$membre/@role" /></h4>
           </xsl:if>
        </xsl:template>
    </xsl:stylesheet>
