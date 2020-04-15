<!doctype html>
<html>
<head>
    <title>Lexik.me</title>
    <#include "fragment/head.ftlh">
</head>
<body>
<h1>Список пользователей</h1>
<#list users>
    <table>
        <thead>
        <tr>
            <th>Name</th>
            <th>Role</th>
            <th>Cmd</th>
        </tr>
        </thead>
        <tbody>
        <#items as user>
            <tr>
                <td>${user.username}</td>
                <td><#list user.roles as role>${role}<#sep>, </#list></td>
                <td><a href="/u/${user.id}">Edit</a></td>
            </tr>
        </#items>
        </tbody>
    </table>
</#list>

</body>
</html>