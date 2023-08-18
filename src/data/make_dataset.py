# -*- coding: utf-8 -*-
import os
from urllib.request import urlretrieve
from urllib.parse import urlsplit
import tarfile
import click
import logging
from pathlib import Path
from dotenv import find_dotenv, load_dotenv

logger = logging.getLogger(__name__)

basePath = "https://zenodo.org/record/7490192/files/"

openaire_files = [basePath + "communities_infrastructures.tar",
                  basePath + "dataset.tar",
                  basePath + "datasource.tar",
                  basePath + "organization.tar",
                  basePath + "otherresearchproduct.tar",
                  basePath + "project.tar",
                  basePath + "publication.tar",
                  basePath + "relation.tar",
                  basePath + "software.tar"]


def download_tar(url, path):
    tar_name = urlsplit(url).path.split('/')[-1] # publication.tar
    tar_path = os.path.join(path, tar_name) # data/raw/publication.tar
    untarred_folder = tar_name.split('.')[0] # publication
    untarred_path = os.path.join(path, untarred_folder) # data/raw/publication
    if not os.path.exists(untarred_path):
        if not os.path.exists(tar_path):
            logger.info('downloading %s' % url)
            urlretrieve(url, tar_path)

        logger.info('untar %s' % tar_name)
        with tarfile.open(tar_path, "r") as tar:
            tar.extractall(path)

        logger.info('cleaning')
        os.remove(tar_path)


@click.command()
@click.argument('output_filepath', type=click.Path(exists=True))
def main(output_filepath):
    """ Downloads data into /data/raw
    """
    for tar in openaire_files:
        download_tar(tar, output_filepath)


if __name__ == '__main__':
    log_fmt = '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
    logging.basicConfig(level=logging.INFO, format=log_fmt)

    # not used in this stub but often useful for finding various files
    project_dir = Path(__file__).resolve().parents[2]

    # find .env automagically by walking up directories until it's found, then
    # load up the .env entries as environment variables
    load_dotenv(find_dotenv())

    main()
