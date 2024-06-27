import OpenAI from 'openai';

// 환경변수에서 API 키를 로드합니다.

export const getResponseFromChatGPT = async (dong, category) => {
    try {
        const openai = new OpenAI({
            apiKey: `${import.meta.env.VITE_OPENAI_API_KEY}`,
            dangerouslyAllowBrowser: true,
        });

        const prompt = `${dong}의 ${category} 정보에 대해 100자 정도로 요약해줘.`;

        const response = await openai.chat.completions.create({
            messages: [
                {
                    role: 'user',
                    content: prompt,
                },
            ],
            model: 'gpt-4',
        });
        return response.choices[0].message.content;
    } catch (error) {
        console.log('chatGPT: 🚨 에러가 발생했습니다.');
    }
};
