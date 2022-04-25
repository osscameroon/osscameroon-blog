# osscameroon-blog

OSS Cameroon blogging website

[blog.osscameroon.com](https://blog.osscameroon.com)

## Prerequisites

The blog is powered by the [Hugo](https://gohugo.io/) website generator, with the [Chunky Poster](https://github.com/puresyntax71/hugo-theme-chunky-poster) theme and might require you to have a set of tools installed on your local machine such as :

* The **Hugo** cli tool, follow [these steps](https://gohugo.io/getting-started/installing) to install **Hugo**
* And a Markdown text editor (We recommend [**Typora**](https://typora.io/))

Learn more about **Hugo** [here](https://www.youtube.com/watch?v=qtIqKaDlqXo&list=PLLAZ4kZ9dFpOnyRlyS-liKL5ReHDcj4G3&ab_channel=MikeDane) or read the [documentation](https://gohugo.io/getting-started/quick-start/).

## Run it locally

Once you have cloned this repository and installed **Hugo** as described [here](https://gohugo.io/getting-started/installing/), you can run the server locally with this command:

```shell
$> hugo server -D
```

The command should output something similar to this

```sh
Start building sites …

                   | EN
-------------------+-----
  Pages            | 20
  Paginator pages  |  0
  Non-page files   |  1
  Static files     | 11
  Processed images |  4
  Aliases          |  0
  Sitemaps         |  1
  Cleaned          |  0

Built in 84 ms
Watching for changes in /Users/elhmn/Work/osscameroon-blog/{archetypes,content,data,layouts,static,themes}
Watching for config changes in /Users/elhmn/Work/osscameroon-blog/config.toml
Environment: "development"
Serving pages from memory
Running in Fast Render Mode. For full rebuilds on change: hugo server --disableFastRender
Web Server is available at http://localhost:1313/ (bind address 127.0.0.1)
Press Ctrl+C to stop
```

If you want to use Docker

```shell
$> docker-compose up
```

### Open the blog locally

Now that your server is running open your web browser on the url displayed in your server output `Web Server is available at http://localhost:1313/`

## How to add a blog post

To add a blog post, make sure you are in the root of the directory then run:

```shell
$> hugo new post/articles/my_new_post.md
/Users/<repository_path>/osscameroon-blog/content/post/articles/<my_new_post_name>.md created
```

Now that your post has been added it should be visible on your local instance at <http://localhost:1313>.

## Add your blog post content

 Open `/osscameroon-blog/content/post/articles/<my_new_post_name>.md` in your text editor and add your blog content.

## How to add an Author

You can add a new **author** to the website simply by running this command:

```shell
$> hugo new authors/<new_author_name>/_index.md
/Users/<repository_path>/osscameroon-blog/content/authors/<new_author_name>/_index.md created
```

The `/content/authors/<new_author_name>/_index.md` file was created and contains new author metadata as follows:

```yaml
---
name: "New Author Name"
images: []
twitter: ""
---
```

## Add Twitter metadata

You can add the new author Twitter handle in the `twitter` field in the `/content/authors/<new_author_name>/_index.md` file.

### Add images

Add images for the new author in the `images` field in the `/content/authors/<new_author_name>/_index.md` file. The first image will be used as a profile picture.

**Note** The images must be added in the new author directory `/content/authors/<new_author_name>/image.png` the added in the `_index.md` as follows:

```yaml
---
name: "New Author Name"
images: ["image.png"]
twitter: ""
---
```

## How to add a contributor

To add a new contributor run:

using `hugo`

```shell
$> hugo new post/contributors/<new_contributor_name>.md
/Users/<repository_path>/osscameroon-blog/content/post/contributors/<new_contributor_name>.md created
```

Your new contributor `<new_contributor_name>.md` file has been created, now add something about him.

### Manually

* Create a file `<new_contributor_name>.md` in osscameroon-blog/content/post/contributors
* Open the `<new_contributor_name>.md` with your editor and add these lines at the top of your file

```markdown
---
title: "<new_contributor_name>"
date: 2021-01-29T20:33:40+01:00
authors: ["<new_contributor_name"]
---
```

* Change the `date: <date>` to the date and time you want
* Save the file

## How Deploy the blog

To deploy the blog, run this command:

```shell
cd ./scripts/ && ./deploy.sh
```

This command might not work due to missing credentials. Contact the project maintainers to get some help.

## Licence

The website is under the  [GPL-3.0 License](https://github.com/osscameroon/osscameroon-blog/blob/main/LICENSE) license, but the blog post are the exclusive property of [OssCameroon](https://osscameroon.com).
