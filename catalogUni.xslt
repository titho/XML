<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="html" indent="yes"/>
  
  <xsl:key name="region-search" match="region" use="@id"/>
  <xsl:template match="/catalog">
    <html>
      <head>
        <title>Universities</title>
        <link rel="stylesheet" type="text/css" href="style.css"/>
        <script src="script.js"></script>
      </head>
      <body>
        <button onclick="sortTable(0)">Sort By Name</button>
        <button onclick="sortTable(1)">Sort By Type</button>
        <button onclick="sortTable(3)">Sort By Year Of Establisment</button>
        <button onclick="sortTable(5)">Sort By Students</button>

        <select id="typeOnSorting">
          <option value="descending">Descending</option>
          <option value="ascending">Ascending</option>
        </select>

        <table border="1" id="universities" >

          <thead>
            <tr>
              <th>Name</th>
              <th>Type</th>
              <th>Dean</th>
              <th>Year Of Establisment</th>
              <th>Academic Staff</th>
              <th>Students</th>
              <th>Location</th>
              <th>Region</th>
              <th>Image</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="./universities/university">
              <xsl:sort select="yearOfEstablishment"/>

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
                  <xsl:value-of select="dean"/>
                </td>
                <td>
                  <xsl:value-of select="yearOfEstablishment"/>
                </td>
                <td>
                  <xsl:value-of select="academicStaff"/>
                </td>
                <td>
                  <xsl:value-of select="students"/>
                </td>
                <td>
                  <xsl:value-of select="location"/>
                </td>
                <!-- <td>
                  <p>
                    <xsl:value-of select="sommelierDiscription/@color"/>
                    <xsl:value-of select="sommelierDiscription/@fragrance"/>
                    <xsl:value-of select="sommelierDiscription/@body"/>
                    <xsl:value-of select="sommelierDiscription/@aftertaste"/>
                  </p>
                </td> -->
                <td>
                  <xsl:value-of select="key('region-search', region/@refid)/address/country"/>,                
                  <xsl:value-of select="key('region-search', region/@refid)/address/domain"/>,
                  <xsl:value-of select="key('region-search', region/@refid)/name"/>,
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


        <table border="1" id="universities" >

          <thead>
            <tr>
              <th>Name</th>
              <th>Country</th>
              <th>Region</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="./regions/region">
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
                  <xsl:value-of select="address/domain"/>
                </td>
              </xsl:element>
            </xsl:for-each>
          </tbody>
        </table>
        
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
