NAME=$1;
TEST_BOILERPLATE="import ${NAME} from './${NAME}';

const setup = () => {
    const context = render(<${NAME} />);

    return {
        context,
    }
};

describe('${NAME} Test Suite', () => {
    it('should render the component', () => {
        const utils = setup();
    })
});
"