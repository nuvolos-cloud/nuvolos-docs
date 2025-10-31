# Restore a snapshot

{% hint style="info" %}
Restoring a snapshot means replacing the content of the current state with the content of the snapshot being restored. Make sure that you have the right permission to restore a snapshot. Only instance editors are allowed to restore snapshots. If you don't have the right permissions to restore a snapshot, then you can either ask the instance editor to do so, or you can ask the instance editor to share the snapshot in your instance where you can work with that snapshot.\

{% endhint %}

## **Restore a snapshot**

1. Open your space.
2. Go to the timeline view of snapshots, which you can do via the toolbar breadcrumbs or from the left sidebar.

![](<../../.gitbook/assets/Screenshot 2024-12-16 160150.png>)

3\. Identify the snapshot you want to restore.

4\. If you want to restore the snapshot to the current state of the currently selected instance, then click on the restore icon next to the snapshot name. Otherwise, if you want to restore the snapshot to the current state of another instance (of which you should be an editor) then click on the two persons icon.

![](<../../.gitbook/assets/Screenshot 2024-12-16 160641.jpg>)

5\. If you chose to restore to the current state of the selected instance, then you will need to confirm the operation. Otherwise, if you chose to restore to another instance, then you will be asked to select the target instance.

{% hint style="success" %}
Regardless of the target instance selected, an automatic snapshot of the current state of the target instance will be created before restoring the snapshot. This allows the user to revert the restoration operation.
{% endhint %}

## Partially restore a snapshot

It is possible to partially restore a snapshot via the [distribution feature](../nuvolos-basic-concepts/distribution.md) of Nuvolos. This can be used to selectively recover **files, tables or application libraries / packages**, without affecting the whole working environment.

The steps to take are the following:

1. Open your space.
2. Identify the snapshot you want to restore and click on the name of the snapshot to open the snapshot.

![](<../../.gitbook/assets/Screenshot 2022-05-02 152731.png>)

&#x20;   4\. [Stage the objects](../nuvolos-basic-concepts/distribution.md) (files, tables or applications) you want to restore.

&#x20;   5\. Select the same instance you are in as the distribution target.

&#x20;   6\. Proceed with the overwriting distribution strategy.

These steps will overwrite the selected files in the current state with the files that were stored in the snapshot.
