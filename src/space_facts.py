import requests


def get_random_space_fact():
    """Get a random interesting fact about space"""
    try:
        response = requests.get("https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY", timeout=10)
        response.raise_for_status()

        data = response.json()
        return data.get('title', 'Unknown'), data.get('explanation', 'No description available')
    except requests.RequestException as e:
        print(f"Error fetching space fact: {e}")
        return "Demo Fact", "The universe is approximately 13.8 billion years old!"


if __name__ == "__main__":
    print("Testing Docker Python Environment")
    print("=" * 40)

    title, description = get_random_space_fact()
    print(f"{title}")
    print(description)