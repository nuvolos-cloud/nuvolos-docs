# The distributed instance

The distributed instance is a special instance that exists in every [space](../../getting-started/nuvolos-basic-concepts/organisational-hierarchy.md#spaces). It serves the purpose of accumulating distributions of the space. The distributed instance is particularly useful in the context of education as it is possible to spawn new student instances from the distributed instance.

The distributed instance has a number of special properties that distinguish it from regular instances.

### Changing the content of the distributed instance

The distributed instance has special content access and modification rules:

* It is possible to push content to the distributed instance via distribution. You can use this feature to push new files to the students, or to overwrite existing files (e.g. after discovering a mistake in a teaching material, you can push the same files to the students again, to have them replaced with the latest version)
*   You can also delete objects from the distributed instance via the actions menu:\


    <figure><img src="../../.gitbook/assets/Screenshot 2025-05-23 094417.png" alt=""><figcaption><p>While in the Distributed instance, you can delete objects for all students</p></figcaption></figure>



{% hint style="info" %}
You can also[ delete files in the distributed instance](./#recall-files) directly from the Master instance.
{% endhint %}

### Access to the distributed instance

All editors of all instances of a particular space have a viewer [role](../../administration/roles/) on the distributed instance. As a consequence, it is possible for any editor to distribute to their own instance from the distributed instance of the space.
