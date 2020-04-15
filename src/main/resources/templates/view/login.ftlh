<#import "fragment/account.ftlh" as acc>
<!DOCTYPE html>
<html>
<head>
    <title>Spring Security Example </title>
</head>
<body>
<h1>Вход</h1>
<@acc.loginForm "/login"/>
<a href="/registration">Регистрация</a>
</body>
</html>