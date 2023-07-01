import openai
import json
import pandas as pd
import logging
import os
from secret_key import openapi_key

openai.api_key = openapi_key

def get_json_str_from_text(text):
    '''
    :param text: sample text " xyz {"Company Name": "Tesla", "Stock Symbol": "TSLA" } .. abc"
    :return: "{"Company Name": "Tesla", "Stock Symbol": "TSLA" }"
    This function returns a valid json string from a long string containing that string plus some
    extra characters. OpenAI somethings returns these extra characters that we want to get rid of
    '''
    import re
    pattern = r"\{([^{}]+)\}"
    match = re.search(pattern, text)
    if match:
        return match.group()

    return None

def extract_financial_data(text):
    prompt = get_prompt_financial() + text
    response = openai.ChatCompletion.create(
        model="gpt-3.5-turbo",
        messages=[{"role": "user","content": prompt}]
    )
    content = response.choices[0]['message']['content']

    logging.info("\nOpenAI response:\n" + content + "\n-----\n")
    json_str = get_json_str_from_text(content)
    logging.info("\nJSON str:\n" + json_str + "\n-----\n")

    if json_str:
        try:
            data = json.loads(json_str)
            return pd.DataFrame(data.items(), columns=["Measure", "Value"])
        except (json.JSONDecodeError, IndexError):
            # Handle the error when the argument is not a valid dictionary
            logging.error("Error: Invalid JSON string or empty list")

    return pd.DataFrame({
        "Measure": ["Company Name", "Stock Symbol", "Revenue", "Net Income", "EPS"],
        "Value": ["", "", "", "", ""]
    })


def get_prompt_financial():
    return '''Please retrieve company name, revenue, net income and earnings per share (a.k.a. EPS)
    from the following news article. If you can't find the information from this article 
    then return "". Do not make things up.    
    Then retrieve a stock symbol corresponding to that company. For this you can use
    your general knowledge (it doesn't have to be from this article). Always return your
    response as a valid JSON string. The format of that string should be this, 
    {
        "Company Name": "Walmart",
        "Stock Symbol": "WMT",
        "Revenue": "12.34 million",
        "Net Income": "34.78 million",
        "EPS": "2.1 $"
    }
    News Article:
    ============
    
    '''

def poem_on_samosa():
    # legacy api call. They are suggesting to use ChatCompletion instead of Completion
    # response = openai.Completion.create(
    #     model="text-davinci-003",
    #     prompt="Can you write a poem on my love for samosa? Only 4 lines please.",
    #     temperature=1,
    #     max_tokens=50
    # )
    # print(response.choices[0].text)

    response = openai.ChatCompletion.create(
        model="gpt-3.5-turbo",
        messages=[
            {
                "role": "user",
                "content":  "Can you write a poem on my love for samosa? Only 4 lines please."
            }
        ]
    )

    print(response.choices[0]['message']['content'])

if __name__ == "__main__":
    poem_on_samosa()

