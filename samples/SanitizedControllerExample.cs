using Microsoft.AspNetCore.Mvc;

namespace SportsForYou.Showcase.Samples;

/// <summary>
/// Sanitized example only.
/// This file demonstrates controller organization style without exposing production code.
/// </summary>
[ApiController]
[Route("api/showcase/events")]
public sealed class SanitizedControllerExample : ControllerBase
{
    [HttpGet("{id:guid}")]
    public IActionResult GetEventSummary(Guid id)
    {
        if (id == Guid.Empty)
        {
            return BadRequest(new
            {
                message = "Invalid event identifier."
            });
        }

        var response = new
        {
            id,
            name = "Sample Sports Event",
            status = "Published",
            source = "Sanitized showcase data"
        };

        return Ok(response);
    }
}
