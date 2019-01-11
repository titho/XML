<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="html" indent="yes"/>
  
  <xsl:key name="affiliate-search" match="affiliate" use="@id"/>
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
        <button onclick="sortTable(3)">Sort By year of establisment</button>
        <button onclick="sortTable(5)">Sort By students</button>

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
              <th>Year of establisment</th>
              <th>Academic Staff</th>
              <th>Students</th>
              <th>Location</th>
              <th>Students</th>
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
                  <xsl:value-of select="key('affiliate-search', affiliate/@refid)/address/region"/>,
                  <xsl:value-of select="key('affiliate-search', affiliate/@refid)/name"/>,
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
              <th>Region</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="./affiliates/affiliate">
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
