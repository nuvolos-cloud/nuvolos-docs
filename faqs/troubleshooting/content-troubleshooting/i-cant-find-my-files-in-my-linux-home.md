# I can't find my files in my Linux home

If you cannot find the files you expect in a running application in your HOME folder, it's recommended to check the following:

* First, try to locate the files in the web UI, in the [Personal ](../../../features/file-system-and-storage/file-navigator.md#workspace-vs-personal-files)view of the file navigator. If they're there, the problem is with the application itself. If not, please reach out to support.
* If the problem is with the application, check if the app runs in [Shared mode](../../../features/applications/configuring-applications.md#run-in-shared-mode). In shared applications, the app is run with a special user, so you won't find your usual files in the HOME folder.
* Check if [Persist sessions data in home area between restarts](../../../features/applications/configuring-applications.md#persist-sessions-data-in-home-area-between-restarts) is enabled. If not, the apps home folder will be initialized as empty on each start, and changes in the HOME folder are not persisted.
