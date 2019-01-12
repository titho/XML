<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="html" indent="yes"/>
  
  <xsl:key name="winary-search" match="winary" use="@id"/>
  <xsl:template match="/catalog">
    <html>
      <head>
        <title>Wines</title>
        <link rel="stylesheet" type="text/css" href="style.css"/>
        <script src="script.js"></script>
      </head>
      <body>
        <button onclick="sortTable(0)">Sort By Name</button>
        <button onclick="sortTable(2)">Sort By Producer</button>
        <button onclick="sortTable(3)">Sort By year of manufacture</button>
        <button onclick="sortTable(4)">Sort By year of packaging</button>
        <button onclick="sortTable(6)">Sort By price</button>

        <select id="typeOnSorting">
          <option value="descending">Descending</option>
          <option value="ascending">Ascending</option>
        </select>

        <table border="1" id="wines" >

          <thead>
            <tr>
              <th>Name</th>
              <th>Type</th>
              <th>Producer</th>
              <th>Year of manufacture</th>
              <th>Year of packaging</th>
              <th>Package</th>
              <th>Price</th>
              <th>Sommelier Discription</th>
              <th>Address</th>
              <th>Image</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="./wines/wine">
              <xsl:sort select="yearOfManufacture"/>

              <xsl:element name="tr">
                <xsl:if test="((position() mod 2) &gt; 0)">
                  <xsl:attribute name="bgColor">whiteblue</xsl:attribute>
                </xsl:if>
                <xsl:if test="((position() mod 2) = 0)">
                  <xsl:attribute name="bgColor">##1abc9c</xsl:attribute>
                </xsl:if>
                <td>
                  <xsl:value-of select="name"/>
                </td>
                <td>
                  <xsl:value-of select="type"/>
                </td>
                <td>
                  <xsl:value-of select="producer"/>
                </td>
                <td>
                  <xsl:value-of select="yearOfManufacture"/>
                </td>
                <td>
                  <xsl:value-of select="yearOfPackaging"/>
                </td>
                <td>
                  <xsl:value-of select="package"/>
                </td>
                <td>
                  <xsl:value-of select="price"/>
                </td>
                <td>
                  <p>
                    <xsl:value-of select="sommelierDiscription/@color"/>
                    <xsl:value-of select="sommelierDiscription/@fragrance"/>
                    <xsl:value-of select="sommelierDiscription/@body"/>
                    <xsl:value-of select="sommelierDiscription/@aftertaste"/>
                  </p>
                </td>
                <td>
                  <xsl:value-of select="key('winary-search', winary/@refid)/address/country"/>,
                  <xsl:value-of select="key('winary-search', winary/@refid)/address/region"/>,
                  <xsl:value-of select="key('winary-search', winary/@refid)/name"/>,
                </td>
                <td>
                  <img>
                    <xsl:attribute name="src">
                      <xsl:value-of select="image/@src"/>
                    </xsl:attribute>
                  </img>
                </td>
              </xsl:element>
            </xsl:for-each>
          </tbody>
        </table>


        <table border="1" id="wines" >

          <thead>
            <tr>
              <th>Name</th>
              <th>Country</th>
              <th>Region</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="./wineries/winary">
              <xsl:sort select="Name"/>

              <xsl:element name="tr">
                <xsl:if test="((position() mod 2) &gt; 0)">
                  <xsl:attribute name="bgColor">whiteblue</xsl:attribute>
                </xsl:if>
                <xsl:if test="((position() mod 2) = 0)">
                  <xsl:attribute name="bgColor">##1abc9c</xsl:attribute>
                </xsl:if>
                <td>
                  <xsl:value-of select="name"/>
                </td>
                <td>
                  <xsl:value-of select="address/country"/>
                </td>
                <td>
                  <xsl:value-of select="address/region"/>
                </td>
              </xsl:element>
            </xsl:for-each>
          </tbody>
        </table>
        
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
