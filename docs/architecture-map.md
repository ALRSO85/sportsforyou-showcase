# Architecture map

Logical view of the application modules and the independently hosted background worker.

```mermaid
flowchart LR
    subgraph WebApp[ASP.NET Core web application]
        PublicSite[Public site and dynamic UI] --> Hubs[Business and platform hubs]
        Hubs --> Services[Application and domain services]
        Services --> Data[Repositories and Unit of Work]
    end

    DB[(SQL Server)]
    Data --> DB

    Worker[Dedicated .NET Worker<br/>JobCenter] --> DB

    Hubs --> AthleteHub[AthleteHub]
    Hubs --> EventHub[EventHub]
    Hubs --> SocialHub[SocialHub]
    Hubs --> UICenter[UICenter]
    Hubs --> ReportCenter[ReportCenter]
```

The worker runs as a separate service and uses the configured SQL Server connection; the diagram does not imply a specific queue technology.
