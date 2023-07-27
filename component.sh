NAME=$1;
COMPONENT_PATH=$NAME/$NAME.tsx
INDEX_PATH=$NAME/index.tsx
COMPONENT_BOILERPLATE="import React from 'react';
import { I${NAME}Props } from './interfaces';
import styles from './styles.module.scss';

const $NAME: React.FC<I${NAME}Props> = () => {
    return <div>Hello world!</div>
}

export default $NAME;"