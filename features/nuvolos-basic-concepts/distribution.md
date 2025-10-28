# Distribution

One of the distinguishing features of the Nuvolos platform is the ability to _distribute_. By this we mean that you can share the content of your work, i.e. your research artefacts or teaching material (results, data, code, applications), with other people. The recipients can be members of your own project team, but also students in your course, or referees and colleagues from outside.&#x20;

Because in Nuvolos the elements of the research workflow, such as applications and data, are containerised (as explained in our sections on [applications](applications.md) and [snapshots](../../features/snapshots/)), it is possible to share them in part or wholesale. This means you can share specific sets of files, database tables, code, applications, or other such results individually with others, but you can also share entire snapshots containing the full state of your work at that time.&#x20;

Instead of having to laboriously send files around individually via email or Dropbox, you can simply use the distribution feature in the Nuvolos platform UI and select what you want to share, and Nuvolos does the rest. This easy distribution method, combined with the ability to save entire work states as [snapshots](../../features/snapshots/), shows the benefits of Nuvolos' containerised and state-based architecture.

## How does distribution work?

What we call _distribution_ is the specific method in Nuvolos through which you can share data (including code, applications, and entire snapshots). Distribution is a push method, not a pull method. This means you select the items you want to share and then push that content to a target location. This is done by using the _distribute objects_ menu option at the bottom of the left-hand bar of the user interface. During the process, the object distribution UI will give you different options for how to deal with push conflicts, such as overriding and copying, just like you would expect with a file system manager.&#x20;

You can also view previous distributions by clicking on the _distributions_ menu option.

## Distribution use cases

Distribution is an important building block in designing efficient workflows in Nuvolos. Some example use cases are:

### Restoring from a snapshot

It is possible to partially restore from a snapshot by distributing selected files back to your workflow. In this way, the Nuvolos snapshot and distribution features enable experimentation, as you always know that if it doesn't work out, you can simply restore from a previous snapshot and try again.

### Distributing teaching material to students

In Nuvolos, you can deliver teaching material to every student in a course at the same time, using the distribution feature for educational use cases. The special benefit of this feature is that it automatically mass distributes the coursework to all students in a course. You can then also distribute applications as working environments along with the coursework, minimising the setup overhead and guaranteeing all students will be working from the same blank slate.

#### A special case in education: assignments.

[Assignments](../../user-guides/education-guides/setting-assignments/) are special distributions, where along with sharing content you also do:

* Add a deadline upon which a response (a _hand-in_) needs to be registered by the student.
* Create a special storage to store responses and a separate special store where you can put your feedback.
* Create an _audit trail_ of all actions that were taken in response to the distribution.

### Involving others in your research

It is very easy to get a new colleague or student up and running with your project thanks to the distribution feature. You simply set up a working environment for them and then distribute any relevant materials (say, an application in a particular configuration and a certain amount of code) to that environment. This saves considerable time on project onboarding and guarantees there are no errors or compatibility issues in the process of transfer.

Beyond this, the distribution feature allows easy sharing of work results of any kind with colleagues outside your project as well. For instance, using the distribution feature, you can share code and application configurations (with their dependencies) directly with referees or colleagues, making it straightforward to meet the demands of scientific reproducibility. You can regularly share results with department colleagues or people in your field at other institutions for informal feedback, benefiting the testing of ideas. Being more than just being a file hosting or sharing service like Dropbox, the Nuvolos distribution feature is intended to smoothen the path of scientific collaboration.

