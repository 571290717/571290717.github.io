AUTHOR = 'the_toast'
SITENAME = 'the_toast'
SITEURL = ''

PATH = 'content'

THEME = './notebook/notebook'

TIMEZONE = 'Asia/Shanghai'

DEFAULT_LANG = 'Chinese (Simplified)'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

# Blogroll
LINKS = (('Pelican', 'https://getpelican.com/'),
         ('Python.org', 'https://www.python.org/'),
         ('Jinja2', 'https://palletsprojects.com/p/jinja/'),
         ('You can modify those links in your config file', '#'),)

# Social widget
SOCIAL = (('GitHub', '#'),
         ('facebook', '#'),
         ('GitHub2', '#'),
          # ('You can add links in your config file', '#'),
          # ('Another social link', '#'),
            ('phone', '13304036141'),
          )

DEFAULT_PAGINATION = 10

# Uncomment following line if you want document-relative URLs when developing
#RELATIVE_URLS = True

# STATIC_PATHS = ['images', 'extra\favicon.ico']
# EXTRA_PATH_METADATA = {
#     'extra/favicon.ico': {'path': 'favicon.ico'}
# }


# DEFAULT_METADATA = {
#     'status': 'draft',
# }

# SITEURL = '/theme/image'


AVATAR = 'avatar.png'

DEFAULT_DATA = 'fs'

FILENAME_METADATA = '(?P<title>.*)'