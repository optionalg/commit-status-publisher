<%@ taglib prefix="props" tagdir="/WEB-INF/tags/props" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="l" tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="forms" tagdir="/WEB-INF/tags/forms" %>
<%@ taglib prefix="bs" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="util" uri="/WEB-INF/functions/util" %>
<jsp:useBean id="propertiesBean" scope="request" type="jetbrains.buildServer.controllers.BasePropertiesBean"/>
<c:url value="${publisherSettingsUrl}" var="settingsUrl"/>
<script type="text/javascript">
  PublisherFeature = {
    showPublisherSettings: function() {
      var url = '${settingsUrl}?publisherId=' + $('publisherId').value;
      $('publisherProperties').refresh = BS.Refreshable.createRefreshFunction('publisherProperties', url, 'false');
      $('publisherProperties').refresh();
    }
  };
</script>
<tr>
  <th><label for="vcsRootId">VCS Root:&nbsp;<l:star/></label></th>
  <td>
    <props:selectProperty name="vcsRootId">
      <c:forEach var="vcsRoot" items="${vcsRoots}">
        <props:option value="${vcsRoot.id}"><bs:trim maxlength="60"><c:out value="${vcsRoot.name}"/></bs:trim></props:option>
      </c:forEach>
    </props:selectProperty>
  </td>
</tr>
<tr>
  <th><label for="publisherId">Publisher:&nbsp;<l:star/></label></th>
  <td>
    <props:selectProperty name="publisherId" onchange="PublisherFeature.showPublisherSettings()">
      <c:forEach var="publisher" items="${publishers}">
        <props:option value="${publisher.id}"><c:out value="${publisher.name}"/></props:option>
      </c:forEach>
    </props:selectProperty>
    <span class="error" id="error_publisherId"></span>
  </td>
</tr>
