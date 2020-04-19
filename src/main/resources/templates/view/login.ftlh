<#import "fragment/common.ftlh" as c>

<@c.page "Вход | Lexik.me">
    <main class="mt-5">
        <div class="row justify-content-center pb-5">
            <div class="col-12 col-sm-8 col-md-7 col-lg-4">
                <div class="mb-5">
                    <div class="shadow border-top border-secondary">
                        <div class="card-body">
                            <h1 class="h3 mb-1 mt-2 text-center">Вход</h1>
                            <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
                                <div class="alert alert-danger" role="alert">
                                    ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
                                </div>
                            </#if>
                            <#if message??>
                                <div class="alert alert-${messageType}" role="alert">
                                    ${message}
                                </div>
                            </#if>
                            <form action="/login" method="post">

                                <div class="my-3">
                                    <input type="text"
                                           class="form-control ${(usernameError??)?string('is-invalid', '')}"
                                           value="<#if user??>${user.username}</#if>" name="username"
                                           placeholder="Имя пользователя">
                                    <#if usernameError??>
                                        <div class="invalid-feedback">
                                            ${usernameError}
                                        </div>
                                    </#if>
                                </div>

                                <div class="my-3">
                                    <input type="password"
                                           class="form-control ${(passwordError??)?string('is-invalid', '')}"
                                           name="password"
                                           placeholder="Пароль">
                                    <#if passwordError??>
                                        <div class="invalid-feedback">
                                            ${passwordError}
                                        </div>
                                    </#if>
                                </div>

                                <input type="hidden" name="_csrf" value="${_csrf.token}">

                                <button type="submit" class="btn btn-primary btn-block">Войти</button>
                            </form>
                        </div>
                        <div class="card-footer text-muted">
                            Нет аккаунта?
                            <span class="font-weight-bolder ">
                                <a href="/registration">Создать новый аккаунт</a>
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