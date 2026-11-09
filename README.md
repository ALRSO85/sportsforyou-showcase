# SportsForYou Showcase

> Public, sanitized technical case about the architecture and engineering of SportsForYou. It does not include private source code, credentials, customer data or sensitive infrastructure details.

**Prefer Portuguese?** Read the [interview overview in Brazilian Portuguese](docs/interview-talking-points-ptbr.md).

[Visit SportsForYou](https://sportsforyou.com.br/)

## Case at a glance

SportsForYou is a modular sports platform connecting athletes, events, communities, organizers, partners and brands. Its product areas run in a modular web application, while asynchronous work is handled by a separate .NET Worker service.

**My role:** I am responsible for the product design, architecture and construction.

**Technical focus:** modular architecture, .NET, database governance, quality automation, accessibility, security and operational readiness.

## What this demonstrates

The case documents modular system design, an independently operated .NET Worker, database governance, automated quality and AI-assisted workflows for documentation, log analysis and architecture planning.

## Architecture decision: independent background processing

Business modules remain in the web application. Asynchronous jobs run in the dedicated `Sport.Worker.JobCenter` service, with its own container, health check and operating lifecycle in Docker Compose.

See the [architecture map](docs/architecture-map.md) and the [architecture overview](docs/architecture.md).

## Technology in this product

- **Application:** C#, .NET 10, ASP.NET Core MVC, Razor Views and modular domain projects.
- **Data:** SQL Server is the production provider; MySQL support is limited to compatible scenarios and abstraction tests.
- **Delivery:** Docker Compose on Ubuntu Server, Cloudflare Tunnel for ingress and Azure Pipelines.
- **Quality:** xUnit v3, Playwright and axe-core checks for the documented automated accessibility scope.
- **Security:** ASP.NET Core authentication, OpenID Connect, JWT, antiforgery, Content Security Policy, rate limiting and persistent Data Protection.

The [technology stack document](docs/technology-stack.md) describes the evidence and scope in more detail.

## Explore the case

- [Modules](docs/modules.md)
- [Quality gates and automation](docs/quality-gates.md)
- [Frontend, SEO and accessibility](docs/frontend-seo-accessibility.md)
- [Database governance](docs/database-governance.md)
- [Interview talking points — PT-BR](docs/interview-talking-points-ptbr.md)
- [Sanitized code and quality samples](samples/)

## Scope and confidentiality

This is an interview-oriented technical case, not a complete open-source product. It describes architecture, engineering practices and product context without publishing production code, credentials, customer data, proprietary business rules, private endpoints, logs or sensitive deployment details.
