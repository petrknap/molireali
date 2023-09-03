#!/usr/bin/env python3
import argparse
import re


def update_dockerfile(path: str, image: str, includes: str) -> None:
    with open(path, 'r+') as file:
        content = file.read()
        include_regions = re.split(r'# region include[d]? ', content)
        content = re.sub(r'FROM ([^\s]+)', f'FROM {image}', include_regions[0])
        for include_region in include_regions[1:]:
            include_region = include_region.split('# endregion', 1)
            component = include_region[0].split('\n')[0]
            tail = include_region[1]
            with open(f'{includes}/{component}.dockerfile', 'r') as component_file:
                component_content = '\n'.join(component_file.read().split('\n')[1:]).strip()
                content = f'{content}# region included {component}\n{component_content}\n# endregion{tail}'
        file.seek(0)
        file.truncate(0)
        file.write(content)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--file', type=str, required=True, help='Path to Dockerfile')
    parser.add_argument('--image', type=str, required=True, help='Source image and tag')
    parser.add_argument('--includes', type=str, required=True, help='Path to includes')
    args = parser.parse_args()

    update_dockerfile(args.file, args.image, args.includes)
