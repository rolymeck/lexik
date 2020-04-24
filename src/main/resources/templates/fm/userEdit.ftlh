<#import "fragment/common.ftlh" as c>

<@c.page "${user.username} | Lexik.me">
    <main class="container mt-5">
        <h1>Пользователь ${user.username}</h1>
        <form action="/u" method="post">
            <input type="text" name="id" value="${user.id}" readonly/>
            <input type="text" name="username" value="${user.username}"/>
            <#list roles as role>
                <label><input type="checkbox"
                              name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}/>${role}
                </label>
            </#list>
            <input type="hidden" value="${_csrf.token}" name="_csrf"/>
            <button type="submit">Save</button>
        </form>
    </main>
</@c.page>