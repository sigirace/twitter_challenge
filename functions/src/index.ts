import * as functions from "firebase-functions/v2";
import { getFirestore } from "firebase-admin/firestore";
import * as admin from "firebase-admin";
import { onObjectFinalized } from "firebase-functions/v2/storage";

admin.initializeApp(); // Firebase Admin 초기화

export const onVideoCreated = functions.firestore.onDocumentCreated(
  "videos/{videoId}",
  async (event) => {
    const snapshot = event.data;
    const videoId = event.params.videoId;

    if (snapshot) {
      await getFirestore().collection("videos").doc(videoId).update({
        "hello": "from functions"
      });
      console.log(`Video document ${videoId} updated with hello message.`);
    } else {
      console.error("No snapshot data available.");
    }
  }
);
