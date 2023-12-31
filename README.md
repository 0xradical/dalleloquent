# Dalleloquent

Most Anki decks used for language learning focus on
recognition rather than recalling. The former is presenting
a word in your target language and asking you to translate it
to your native language. The latter is about asking you to 
*produce* something in your target language based on input (
an image, video, or a vague description).

As I was having a hard time finding Anki decks in recalling mode,
this project aims to generate Anki cards automatically for the
most common words and expressions used in English using Dall-e and GPT-4,
provided by OpenAPI.

## Setup 

1) Create a .env (use .env.example as a template)

## Specifications

There's a database of common phrases, idioms, expressions, verbs that
someone wants to remember periodically. This database can be created
using OpenAI as well. For example, you can ask GPT-4 for the following: 

```
Give me the 100 most common idioms in English that can be used in 
a professional setting
```


## License

[MIT](./LICENSE)