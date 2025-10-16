# Background Tasks

Certain operations on the Nuvolos platform, such as distributing large files or creating snapshots, can take more than a few seconds to complete. These operations are executed asynchronously as "background tasks," allowing you to continue your work without interruption.

## Monitoring Your Tasks

You can monitor the status of your active and recent tasks through the tasks view, which is accessible from the notifications symbol in the main UI.

The tasks view provides a list of your recent tasks, their status (e.g., running, completed, failed), and a description of the operation. You can view the full outcome or any error messages by clicking the magnifier icon next to a task.

## Cancelling a Task

If you need to stop a task that is currently running, you can do so by clicking the red cancel icon in the status column of the tasks view. This will send a termination signal to the task.

Please note that some low-level operations may need to complete before the task fully terminates.
