<script setup>
import { ref } from "vue";
import { getResponseFromChatGPT } from "@/api/chatGPT";
const Props = defineProps(["dong"]);
const answer = ref("");
const onOffSpiner = ref(false);
const doSearch = async (text) => {
    answer.value = "";
    onOffSpiner.value = true;
    try {
        answer.value = await getResponseFromChatGPT(Props.dong, text);
        onOffSpiner.value = false;
    } catch (error) {
        console.error("ChatGPT 응답 조회 실패:", error);
    }
};
</script>

<template>
    <h4 class="fw-semibold ms-1">
        <img
            src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAACXBIWXMAAAsTAAALEwEAmpwYAAAFaElEQVR4nO2abWiWVRjHf0stzUUusloUZTZRKqjAolimZs1cubI+JKWInyrLPlSEZRYhJSmVZUiZRRFmRS9QRhCZVmYqKqPIDRKJnBVLk3ybs+2JC/43XN3c53553NY+PH94kJ1znXPf17ne/ue6hQoqqKCvcB7wOLAe2AN06t/vNH4+/RzDgJXAMaCU8vsHWAwMoR/iEuBXvahZ4C2gCTgHOBE4C5gEvO4U3Q7U0I9wEbBXL7cBGJVDfofkNwL3SsE1+plVbayWPsRQ4Ce91IfASTnXXQ905XDBj4E6+gDznZucnEP+DOBVp8QR4B1ZYCpwIzAXeB/ocDL39aYSg4G/9LBrMmQtTh4E9kv+KLAEODNlzenACqBbaxbQS2jSA77PkLsJaHUu80mOOPK4UwnE1k6jh2An+BTwrU7VNn80IDsG+NwpYLHUUOZz79Eee483050g0x5MCMrbYrL2oBfcKe4DHgAGpcSNJY0sfKH9HipXiSHKSCX5qwXiFLmUjY2LyX/tss5y+XoSqoFFsmw7cDcwICPTlZS6y8IrzqwT3fg3Gq+Pye/S+PjAflXAdGB3gnWbgQmBdQOBQzpMO4RCmKoHHFL1JociP2v8goT9bI917sXNqmMVxDvd+AfAiIT12zV/WVFFtmphUh4PKRJlqLoYD3vR0ZM/gNmKPZ/O5wEHXP14Onb62zRn7CA3rtKiPYGKHVIkoh+j9aKz9eLRaXfrYMzFknA28KarH23ATMVPVLeMu+XGPC1aGpgPKfKjxmcBm5wC652F7bc5Ya3HlS6hlNy+LRTEe1o4vaAizbEA3q09qmShWbFAtyw4MvCMKmCGrBLJW7UvhM+08IaCikR+fFTpNSnDWN14wtWlDt1RLJaScCqwysn67JmJNVrYWFCRLRqfnOMZjTHrWT2Zo1SbhKWS+x0YnleR5zMqaUiRyK/Nx7NwrWQt033lFNoROMAqJ/dSXkVmaMHaDEUWxujHBo1fneMZ9ZK1vQy3xAjmMwEO1630HHLF/2CY/LFLqTSORe6BrXoJr2AWtfcp3pSPYIeyMKZgHGs1b4edC8u04MtA3m90daMks7dmUBSPKwJXgfoMRR7W/HN5FRmuwEqrJwMVoO2xwLV7SBYaJLuloCI3a/5TCmCiu3auUioMueJiJ2up9ckARa+W/0d3mm0FFZlcjiKoCEUn3SbfDFGMkSpyviDOUjG0NXckMN/mgorcpfnVRRWJ/P6HGHNNS7H1oiGR/FbRlOjvTVIwoh9FFFmm+UeKKFGrRX+KuM10lKFbBM+IXhKqRBAjAhhnvqMDl6X6FEWMwP6meUsWuXFxQkBWi2If0dwBkUyj4hHizPeYqLzP/XUufedV5P5AgsjE5c414hihS1B02jt1SRobY67rEi5m6PJV0mUsjyKXAoc1Z5mrEE6RaxxMuVNPSGC9ceabhPGS25VDkUlqZNj4y5SJFm1wXYrMADUQ2jOYL2pILFeDIrqreIxzCWVKzOrvFmjNBiuptWSyMDSFmQ5Sayg62U61juKc6fYE6/6tLBWybi7UuI67NcvKQYNreJfUvDMCmNZTPizaY03A0+ghTHPZx9qYeTFKbVJPMLPoy2bJWhenV7DA1Y8VKc23qL26xNGQ/WpkW0M7DVEC2Hc8sZAHc1z96BAdmatPAk2aX+04V5c+JVhrNE98RezB6lKv40LgoxzfC7tS7vxxDNaHnYiy5Pne0mOo1UealbrjGxt9TWl4o16qJVAMPca4AmrpO+ki97+hxnVUzHJvyDq1ipNzgVuBt51lfynaRewrWCf/WVf4Qr9ONctDd51+9Z8I5usDUZsyWZtqxGOyTgUVVEDv41/8yxmQXOu50gAAAABJRU5ErkJggg=="
            width="40px"
        />
        <span>&nbsp;Homescanner AI가 알려주는&nbsp;</span>
        <span class="fw-bolder text-decoration-underline" style="color: var(--main-color)">
            {{ Props.dong }}
        </span>
        <span>&nbsp;정보</span>
    </h4>
    <div
        class="container p-3"
        style="
            width: 100%;
            background-color: white;
            border: 2px solid whitesmoke;
            border-radius: 10px;
        "
    >
        <div class="row justify-content-center my-3">
            <div class="col-2">
                <button type="button" @click="doSearch('치안')" class="btn btn-primary">
                    <i class="bi bi-taxi-front"></i>&nbsp;치안 정보
                </button>
            </div>
            <div class="col-2">
                <button type="button" @click="doSearch('학군')" class="btn btn-secondary">
                    <i class="bi bi-mortarboard"></i>&nbsp;학군 정보
                </button>
            </div>
            <div class="col-2">
                <button type="button" @click="doSearch('의료')" class="btn btn-success">
                    <i class="bi bi-activity"></i>&nbsp;의료 정보
                </button>
            </div>
            <div class="col-2">
                <button type="button" @click="doSearch('유동 인구')" class="btn btn-info">
                    <i class="bi bi-person-walking"></i>&nbsp;유동 인구
                </button>
            </div>
        </div>

        <div
            class="row my-3 col-12 mx-auto"
            style="border: 2px solid gray; border-radius: 10px; height: 110px"
        >
            <div
                class="spinner-border text-secondary"
                style="margin: auto auto; height: 70px; width: 70px"
                v-show="onOffSpiner"
                role="status"
            >
                <span class="visually-hidden">Loading...</span>
            </div>
            <p class="fw-medium fs-6" v-html="answer.replace('.', '.<br>')"></p>
        </div>
    </div>
</template>

<style scoped></style>
