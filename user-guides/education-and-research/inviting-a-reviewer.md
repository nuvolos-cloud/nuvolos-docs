# Inviting a reviewer

The following guide describes how to invite a foreign reviewer (such as a journal editor) to your research project.

## Requirements

We assume the following setup on your behalf prior to executing the invitation of the foreign reviewer:

1. You have a research space in which an instance holds your complete research setup: applications, source codes and data.
2. You are space administrator of the research space.

Your goal is to achieve the following:

* Your editor is to assume control an _exact_ copy of your complete research setup.
* Your editor may want to re-run pieces or the entirety of your code to affirm or reproduce your research.
* Your editor should **not access** anything else in your organization apart from the copy of your research setup.

## Solution

We suggest you do the following steps in succession.

1. Create a snapshot of the instance in which you have your complete research environment.
2. Create an instance in the same space you are doing your research.
3. Distribute the snapshot created in #1 to the instance created in #2.
4. Invite the journal editor to the instance created in #2 as instance editor.

This setup satisfies all the criteria set in the previous section.

## Limitations

The approach presented is suited exactly for the use-case presented in the requirements section.

### Anonymity

The setup suggested here is not suitable for handling anonymous referees. As you are space administrator when creating the instance for the to-be-editor of the instance and handling invitations directly, you will always be aware of the users in your space.

### Role proliferation

Another possible use-case revolves around the invited user being able to invite new users to the space. An instance editor does not have the necessary scope or rights in order to do this. In particular if a journal editor were to invite other colleagues to the project, they would not be able to do this with the setup presented.
