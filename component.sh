COMPONENT_NAME=$1;
COMPONENT_FILENAME=$(basename "$COMPONENT_NAME")
COMPONENT_PATH=$COMPONENT_NAME/$COMPONENT_FILENAME.tsx
COMPONENT_BOILERPLATE="import React from 'react';
import { I${COMPONENT_NAME}Props } from './interfaces';
import styles from './styles.module.scss';

const $COMPONENT_NAME: React.FC<I${COMPONENT_NAME}Props> = () => {
    return <div>Hello world!</div>
}

export default $COMPONENT_NAME;"