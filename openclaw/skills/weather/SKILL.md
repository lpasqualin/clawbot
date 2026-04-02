---
name: weather
description: Get current weather and forecasts for Fort Lauderdale, FL. Use when the user asks about weather, temperature, rain, or conditions.
homepage: https://open-meteo.com
metadata:
  clawdbot:
    emoji: "🌤️"
    requires:
      env: []
---

# Weather Skill

Weather data for Fort Lauderdale, FL via Open-Meteo (no auth required).

**Do not use wttr.in — it is blocked on this network. Always use the Open-Meteo endpoint below.**

---

## Endpoints

### Current conditions
```
GET https://api.open-meteo.com/v1/forecast?latitude=26.12&longitude=-80.14&current_weather=true
```
```bash
curl -s "https://api.open-meteo.com/v1/forecast?latitude=26.12&longitude=-80.14&current_weather=true"
```
Returns `.current_weather` with:
- `.temperature` — current temp in **Celsius**
- `.windspeed` — km/h
- `.weathercode` — WMO code (see table below)

### 3-day forecast (high/low/precip)
```
GET https://api.open-meteo.com/v1/forecast?latitude=26.12&longitude=-80.14&daily=temperature_2m_max,temperature_2m_min,precipitation_sum,weathercode&timezone=America%2FNew_York&forecast_days=3
```
```bash
curl -s "https://api.open-meteo.com/v1/forecast?latitude=26.12&longitude=-80.14&daily=temperature_2m_max,temperature_2m_min,precipitation_sum,weathercode&timezone=America%2FNew_York&forecast_days=3"
```
Returns `.daily` arrays indexed by day (0 = today):
- `temperature_2m_max[]` / `temperature_2m_min[]` — Celsius
- `precipitation_sum[]` — mm
- `weathercode[]` — WMO code per day
- `time[]` — date strings

---

## Temperature Conversion

All temperatures from the API are in **Celsius**. Always display in Fahrenheit:

```
F = C × 9/5 + 32
```

Examples: 30°C = 86°F | 25°C = 77°F | 20°C = 68°F

---

## WMO Weather Code Reference

| Code | Condition |
|------|-----------|
| 0 | Clear sky |
| 1–3 | Partly cloudy |
| 45, 48 | Fog |
| 51–55 | Drizzle |
| 61–67 | Rain |
| 71–77 | Snow |
| 80–82 | Rain showers |
| 95 | Thunderstorm |
| 96, 99 | Thunderstorm with hail |

---

## Usage Examples

**Current conditions:**
```bash
curl -s "https://api.open-meteo.com/v1/forecast?latitude=26.12&longitude=-80.14&current_weather=true" \
  | python3 -c "
import json, sys
d = json.load(sys.stdin)['current_weather']
c = d['temperature']; f = c * 9/5 + 32
print(f\"{f:.0f}°F ({c}°C), windspeed {d['windspeed']} km/h, code {d['weathercode']}\")
"
```

**Today's high/low:**
```bash
curl -s "https://api.open-meteo.com/v1/forecast?latitude=26.12&longitude=-80.14&daily=temperature_2m_max,temperature_2m_min,precipitation_sum,weathercode&timezone=America%2FNew_York&forecast_days=1" \
  | python3 -c "
import json, sys
d = json.load(sys.stdin)['daily']
hi = d['temperature_2m_max'][0] * 9/5 + 32
lo = d['temperature_2m_min'][0] * 9/5 + 32
print(f\"High {hi:.0f}°F / Low {lo:.0f}°F, precip {d['precipitation_sum'][0]}mm\")
"
```

**3-day forecast:**
```bash
curl -s "https://api.open-meteo.com/v1/forecast?latitude=26.12&longitude=-80.14&daily=temperature_2m_max,temperature_2m_min,precipitation_sum,weathercode&timezone=America%2FNew_York&forecast_days=3" \
  | python3 -c "
import json, sys
d = json.load(sys.stdin)['daily']
for i in range(3):
    hi = d['temperature_2m_max'][i] * 9/5 + 32
    lo = d['temperature_2m_min'][i] * 9/5 + 32
    print(f\"{d['time'][i]}: High {hi:.0f}°F / Low {lo:.0f}°F, code {d['weathercode'][i]}, precip {d['precipitation_sum'][i]}mm\")
"
```
