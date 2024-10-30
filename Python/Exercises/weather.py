"""Get weather information for a city specified by the user.
Before running the script: insert your API key below.
"""

import requests

API_KEY = ""  # TODO: insert your API key here


def get_city_from_user(msg: str = "Enter a city: "):
    return input(msg).strip()


def get_weather_info(city: str) -> dict | None:
    url = f"https://api.openweathermap.org/data/2.5/weather?q={city}&appid={API_KEY}&units=metric"
    try:
        resp = requests.get(url)
    except requests.exceptions.RequestException as e:
        print(f"Error: {e}")
        return None
    if not resp.ok:
        print(f"Unsuccessful response! Status code {resp.status_code}")
        return None
    return resp.json()


def create_weather_info_message(weather_info: dict) -> str:
    return f"""Weather for {weather_info["name"]}:
  Main weather: {weather_info["weather"][0]["description"]}
  Temperature: {weather_info["main"]["temp"]} Celsius
  Humidity: {weather_info["main"]["humidity"]} %
  Wind speed: {weather_info["wind"]["speed"]} km/h
"""


def main():
    if API_KEY == "":
        print("Add your API key before running the script!")
        return

    city = get_city_from_user()
    weather_info = get_weather_info(city)
    if weather_info is None:
        print(
            "Failed to get weather information from OpenWeatherMap! Check your internet connection!"
        )
        return
    print(create_weather_info_message(weather_info))


if __name__ == "__main__":
    main()