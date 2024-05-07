#!/usr/bin/python3

"""returns the number of subscribers"""
import requests


def number_of_subscribers(subreddit):
    """returns the number of subscribers"""
    headers = {'User-Agent': 'alxAPI'}
    res = requests.get(
        'https://www.reddit.com/r/{}/about.json'.format(subreddit),
        headers=headers,
        allow_redirects=False
    )

    if res.status_code == 200:
        return res.json()['data']['subscribers']
    else:
        return 0
