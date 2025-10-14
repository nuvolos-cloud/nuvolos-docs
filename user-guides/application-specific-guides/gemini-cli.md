# Gemini CLI

The [Gemini CLI](https://github.com/google-gemini/gemini-cli?tab=readme-ov-file#gemini-cli) Nuvolos application enables you to install Google's AI Agent with one click. It is based on the Terminal application and supports long-running sessions.

## Authentication

Gemini CLI supports using an existing API key directly, which means it's enough to configure the `GEMINI_API_KEY` environment variable to use the application. We recommend to use [Nuvolos secrets](https://docs.nuvolos.cloud/features/environment-variables-and-secrets#secrets) to store the API key securely.&#x20;

By using space-level secrets, you can define a shared API key for everyone to use in a specific Nuvolos project.

## Configuration files

Gemini CLI stores your user configurations in your HOME folder, in a `.gemini`  subfolder.&#x20;
