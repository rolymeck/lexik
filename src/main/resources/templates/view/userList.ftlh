<#import "fragment/common.ftlh" as c>

<@c.page "Пользователи | Lexik.me">
    <main class="container mt-5">
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
    </main>
</@c.page>