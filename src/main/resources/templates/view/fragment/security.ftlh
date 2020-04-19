<#assign
known = Session.SPRING_SECURITY_CONTEXT??
>

<#if known>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    isAdmin = user.isAdmin()
    isAuth = true
    >
<#else>
    <#assign
    isAdmin = false
    isAuth = false
    >
</#if>