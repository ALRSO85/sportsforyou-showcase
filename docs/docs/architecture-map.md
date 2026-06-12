flowchart TD
    PublicSite[Public Website / SEO Pages]
    WebApp[Web Application / Dynamic UI]
    Hubs[Business Hubs]
    Services[Domain Services]
    Data[Repositories / Unit of Work]
    DB[(SQL Server)]

    PublicSite --> WebApp
    WebApp --> Hubs
    Hubs --> Services
    Services --> Data
    Data --> DB

    Hubs --> AthleteHub[AthleteHub]
    Hubs --> EventHub[EventHub]
    Hubs --> SocialHub[SocialHub]
    Hubs --> UICenter[UICenter]
    Hubs --> JobCenter[JobCenter]
    Hubs --> ReportCenter[ReportCenter]
