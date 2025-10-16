# Setting assignments

Nuvolos supports the creation, dissemination, and review of assignments, without having to download, upload, and send files around.

{% hint style="info" %}
Always use the _Master_ (instructor's) instance to create an assignment.
{% endhint %}

### Creating an assignment

An assignment is a collection of Nuvolos objects (e.g. files, folders) and an associated deadline until which the students can hand in their work.

An assignment is created whenever during material distribution time, the "Create an assignment" checkbox is selected. In this case, the deadline until which hand-ins are accepted needs to be selected (after the deadline passes, students can no longer hand-in material).

Created assignments are visible on the dashboard of a space, as well from Assignments overview page, that can be accessed from the sidebar as shown on the image below.

![](<../../../.gitbook/assets/Screenshot 2022-01-27 at 13.33.16.png>)

{% hint style="info" %}
In most cases, the instructor prepares the placeholder files that will be filled out by the student and distributes these placeholders. It is also possible however to stage and distribute entire directories when an assignment is created, in this case, the whole directory will be handed in by the student and the instructor can review whatever material was inside at hand-in time.
{% endhint %}

#### Viewing the assignments

As described in the previous section the assignment overview page gives a more detailed description of the assignments in the space. Here you will be able to check the submission and the assignment  status.  From red to green, colours indicate how much time is still left to hand in solutions.

![](<../../../.gitbook/assets/Screenshot 2022-01-27 at 15.18.46.png>)

#### Modifying assignments

Space administrators can modify assignments (deadlines, descriptions and handback visibility) from the assignment overview page under the actions column, or by opening an assignment from the space overview or from the assignments overview page by clicking on the edit button under the details.

![](<../../../.gitbook/assets/Screenshot 2022-01-27 at 13.47.31.png>)

### Reviewing assignments

To grade assignments, a space administrator can click the "Grade" button on the assignment  view. This will open the grade table, from which each assignment hand-in can be opened by clicking the "Review" button.

This will launch the application inside the student instance, with a **copy** of the student submission mounted in the files area. All packages installed by the student will be available for the instructor, so open-ended projects are fully supported as well.

The files submitted can be downloaded without opening an application under the handback tab. You can select which handin to review from the dropdown menu shown below.

![](<../../../.gitbook/assets/Screenshot 2022-01-27 at 15.05.17.png>)

{% hint style="info" %}
Students are allowed to submit solutions multiple times until the deadline of the assignment has passed. However, Nuvolos only allows you to grade the latest submission coming from the same instance, and by default, only these submission are shown on the Handin tab. To inspect non-latest handins, untick the "Show only gradeable handins" checkbox on the Handin tab.\
\
Also, the name of each submission may be choosen freely by the students, to support using custom identifiers (e.g. student ID number, etc.). Nuvolos will group submissions coming from the same instance as different versions coming from the same entity, and only the latest submission will be gradeable, even if there were different submissions in the same instance by different users under different names.
{% endhint %}

#### Providing feedback

Feedback can be provided inside the submitted files in any form the instructor sees fit (Nuvolos maintains a copy of the original handed in file for reference if needed).&#x20;

We suggest making explicit (inline) comments so that it is clear to the student when reviewing the hand-back what has been the instructor's (I) comment. An example is below:

```
var = 1   # I: Use a more informative variable name

test_tuple = (False, "test")

if test_tuple:   # I: Use test_tuple[0] instead
    print("This should not appear.")
```

Once the files have been reviewed, the instructor can assign a grade by clicking the grade icon on the sidebar which brings up the grade table. There the currently graded instance / handin will be highlighted and a grade can be entered as free text.

### Handing back assignments

During the grading process, the hand-backs are not visible to students. Once the review of all hand-ins is completed, the assignment can be edited as described above and the visibility of hand-backs can be enabled.&#x20;

By opening the assignment view, students will be able to view their grades and also launch the application with the corrected files available for review (without being able to modify them).

When students start their applications after hand-backs have been enabled, they will see a special Assignments > handback folder, which will contain the reviewed version of the material (read-only). They can then check the reviewed file for feedback from the instructor. Or alternatively they can view the files under the handin and handback tabs from the assignment view.

### Exporting grades

Grades can be exported from the grade table in Excel format which can then be used to upload to other systems if needed.
