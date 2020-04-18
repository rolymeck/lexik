<#import "fragment/common.ftlh" as c>

<@c.page "Сообщения | Lexik.me">
    <main class="mt-5">
        <div class="row justify-content-center pb-5">
            <div class="col-12 col-sm-8 col-md-7 col-lg-4">
                <div class="mb-5">
                    <div class="shadow border-top border-secondary">
                        <div class="card-body">
                            <h1 class="h3 mb-1 mt-2 text-center">Регистрация</h1>
                            <#if message??>
                                <div>${message}</div>
                            </#if>
                            <form action="/registration" method="post">

                                <input type="text" class="form-control my-3" name="username"
                                       placeholder="username">

                                <input type="password" class="form-control my-3" name="password"
                                       placeholder="password">

                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <button type="submit" class="btn btn-primary btn-block">Создать аккаунт</button>
                            </form>
                        </div>
                        <div class="card-footer text-muted">
                            Есть аккаунт?
                            <span class="font-weight-bolder ">
                                <a href="/login">Войти</a>
                                </span>
                        </div>
                    </div>
                    <div class="mt-4">
                        <a class="btn btn-outline-dark btn-block" href="/auth/vk">
                            <span class="fab fa-vk mr-1"></span>
                            Войти через VK
                        </a>
                        <a class="btn btn-outline-dark btn-block" href="/auth/fb">
                            <span class="fab fa-facebook-square mr-1"></span>
                            Войти через Facebook
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </main>
</@c.page>