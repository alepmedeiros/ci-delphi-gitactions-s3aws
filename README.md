# Hello world docker action

Esta ação imprime "Hello World" ou "Hello" + o nome de uma pessoa a ser cumprimentada no log.

## Inputs

### `who-to-greet`

**Obrigatório** O nome da pessoa a quem cumprimentar. Padrão `"World"`.

## Outputs

### `time`

Horário que cumprimentamos você.

## Exemplo de uso

uses: actions/hello-world-docker-action@v1
with:
  who-to-greet: 'Mona the Octocat'
