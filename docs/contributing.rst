How To Contribute
=================

Start contributing today!

Introduction
------------

Below is the workflow for having your contribution accepted into the ``pattoo`` repository.

#. `Check for open issues or open a fresh issue to start a discussion <https://github.com/PalisadoesFoundation/talawa/issues>`_ around a feature idea or a bug. There is a `good first issue` tag for issues that should be ideal for people who are not very familiar with the codebase yet
   * Assign an interesting existing issue to yourself.
   * If you created a discussion issue for a new feature or bugfix, then make sure it's `approved by a maintainer <maintainers>`_ before assigning the issue to yourself.
#. `Fork the repository on GitHub <https://github.com/PalisadoesFoundation/talawa/issues>`_ in preparation for your changes
#. Clone your GitHub repository to your local machine
#. Add the original project as a remote repository `git remote add upstream https://github.com/PalisadoesFoundation/talawa`. Check everything is OK with `git remote -v`.
#. Create a branch named after your issue like this using `git checkout -b issue-789` where `789` is the number of your issue.
#. Write code modifying this branch and commit your changes locally. An example of a proper git commit` message can be seen below:

    .. code-block:: text

        Make the example in CONTRIBUTING imperative and concrete ...

        Without this patch applied the example commit message in the CONTRIBUTING
        document is not a concrete example.  This is a problem because the
        contributor is left to imagine what the commit message should look like
        based on a description rather than an example.  This patch fixes the
        problem by making the example concrete and imperative.

        The first line is a real life imperative statement with a ticket number
        from our issue tracker.  The body describes the behavior without the patch,
        why this is a problem, and how the patch fixes the problem when applied.

        Resolves Issue: #123
        See also: #456, #789

#. We periodically update the master branch of our code. To synchronize the latest changes from our main repository into your current branch do:

    .. code-block:: text

        git fetch upstream
        git merge upstream/master

#. Read the documentation on how to `setup and run tests. <unittest>`_
#. Write the necessary unit tests for your changes.
#. Run all the tests to assure nothing else was accidentally broken
#. Push your changes to your forked repository:

    .. code-block:: text

      git push origin issue-789

#. Perform a pull request on GitHub.
#. `Bug the maintainer <maintainers>`_ until it gets accepted and merged. :)
#. Make sure to add yourself to `CONTRIBUTORS.rst <https://github.com/PalisadoesFoundation/talawa/CONTRIBUTORS.rst>`_

Code Style Guide
----------------

For ease of readability and maintainability code for all ``pattoo`` projects must follow these guidelines. Code that does not comply will not be added to the ``master`` branch.

#. All ``pattoo`` python projects use the `Google Python Style Guide <https://google.github.io/styleguide/pyguide.html#Exceptions>`_ for general style requirements
#. All ``pattoo`` python projects use the The Chromium Projects Python Style Guidelines for docstrings.
#. Indentations must be multiples of 4 blank spaces. No tabs.
#. All strings must be enclosed in single quotes.
#. All code must be compliant with:

.. code-block:: text

    pylint
    PEP8
    PEP257
    pydocstyle
    pycodestyle

#. In addition too being ``pylint`` compliant, the code must be PEP8 and PEP257 compliant too.
#. There should be no trailing spaces in files

Guidelines to Remember
^^^^^^^^^^^^^^^^^^^^^^

* Always opt for the most pythonic solution to a problem
* Avoid applying idioms from other programming languages
* Import each module with its full path name. ie: from pack.subpack import module
* `Use exceptions where appropriate <https://google.github.io/styleguide/pyguide.html#Exceptions>`_
* `Use doc strings <http://sphinxcontrib-napoleon.readthedocs.org/en/latest/example_google.html>`_
* Try not to have returns at multiple points in a function unless they are failure state returns.
* If you are in the middle of a development session and have to interrupt your work, it is a good idea to write a broken unit test about what you want to develop next. When coming back to work, you will have a pointer to where you were and get back on track faster.

Commits
^^^^^^^

The ``pattoo`` projects strive to maintain a proper log of development through well structured git commits. The links below offer insight and advice on the topic of commit messages:

#. https://robots.thoughtbot.com/5-useful-tips-for-a-better-commit-message
#. http://chris.beams.io/posts/git-commit/
