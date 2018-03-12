from setuptools import setup, find_packages

setup(
    name = 'Boms-Away',
    version = '20171029',
    url = 'https://github.com/Jeff-Ciesielski/Boms-Away',
    author = 'Jeff Ciesielski',
    author_email = 'example@invalid.tld',
    description = 'BOM/component manager for KiCad',
    packages = find_packages(),    
    install_requires = ['sqlalchemy', 'wxpython'],
    entry_points={'console_scripts': ['bomsaway=boms_away.bomsaway:start']},
)
