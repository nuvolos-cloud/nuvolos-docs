# OpenAI Codex

The [Codex CLI](https://github.com/openai/codex) Nuvolos application enables you to install OpenAI's open-source Agent with one click. It is based on the Terminal application and supports long-running sessions.

## Authentication

Codex CLI supports using an existing API key directly, which means it's enough to configure the `OPENAI_API_KEY` environment variable to use the application. We recommend to use [Nuvolos secrets](https://docs.nuvolos.cloud/features/environment-variables-and-secrets#secrets) to store the API key securely.&#x20;

By using space-level secrets, you can define a shared API key for everyone to use in a specific Nuvolos project.

## Configuration files

Codex CLI stores your user configurations in your HOME folder, in a `.codex`  subfolder.&#x20;
