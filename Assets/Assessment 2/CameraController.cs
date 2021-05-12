using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using TMPro;

public class CameraController : MonoBehaviour
{
    [Header("Camera")]
    public GameObject fireworksCam, dissolveCam, rippleCam, vineCam, bubblesCam, sparkCam, rainCam, tornadoCam, healCam;
    private AudioListener fireworkAL, dissolveAL, rippleAL, vineAL, bubblesAL, sparkAL, rainAL, tornadoAL, healAL;
    public GameObject healCanvas;

    [Header("Text")]
    public TMP_Text instructionsText;

    // Start is called before the first frame update
    void Start()
    {
        healCanvas.SetActive(false);
        healAL = healCam.GetComponent<AudioListener>();
        fireworkAL = fireworksCam.GetComponent<AudioListener>();
        dissolveAL = dissolveCam.GetComponent<AudioListener>();
        rippleAL = rippleCam.GetComponent<AudioListener>();
        vineAL = vineCam.GetComponent<AudioListener>();
        bubblesAL = bubblesCam.GetComponent<AudioListener>();
        sparkAL = sparkCam.GetComponent<AudioListener>();
        rainAL = rainCam.GetComponent<AudioListener>();
        tornadoAL = tornadoCam.GetComponent<AudioListener>();
    }

    // Update is called once per frame
    void Update()
    {
        #region Activating other cameras in the scene with number buttons on keyboard
        if (Input.GetKeyDown(KeyCode.Alpha1)) //Fireworks Camera
        {
            instructionsText.color = Color.white;

            fireworksCam.SetActive(true);
            fireworkAL.enabled = true;

            dissolveCam.SetActive(false);
            dissolveAL.enabled = false;

            rippleCam.SetActive(false);
            rippleAL.enabled = false;

            vineCam.SetActive(false);
            vineAL.enabled = false;

            bubblesCam.SetActive(false);
            bubblesAL.enabled = false;

            sparkCam.SetActive(false);
            sparkAL.enabled = false;

            rainCam.SetActive(false);
            rainAL.enabled = false;

            tornadoCam.SetActive(false);
            tornadoAL.enabled = false;

            healCam.SetActive(false);
            healAL.enabled = false;
        }
        if (Input.GetKeyDown(KeyCode.Alpha2)) //Dissolve Camera
        {
            instructionsText.color = Color.black;

            fireworksCam.SetActive(false);
            fireworkAL.enabled = false;

            dissolveCam.SetActive(true);
            dissolveAL.enabled = true;

            rippleCam.SetActive(false);
            rippleAL.enabled = false;

            vineCam.SetActive(false);
            vineAL.enabled = false;

            bubblesCam.SetActive(false);
            bubblesAL.enabled = false;

            sparkCam.SetActive(false);
            sparkAL.enabled = false;

            rainCam.SetActive(false);
            rainAL.enabled = false;

            tornadoCam.SetActive(false);
            tornadoAL.enabled = false;

            healCam.SetActive(false);
            healAL.enabled = false;
        }
        if (Input.GetKeyDown(KeyCode.Alpha3)) //Ripple Camera
        {
            instructionsText.color = Color.black;

            fireworksCam.SetActive(false);
            fireworkAL.enabled = false;

            dissolveCam.SetActive(false);
            dissolveAL.enabled = false;

            rippleCam.SetActive(true);
            rippleAL.enabled = true;

            vineCam.SetActive(false);
            vineAL.enabled = false;

            bubblesCam.SetActive(false);
            bubblesAL.enabled = false;

            sparkCam.SetActive(false);
            sparkAL.enabled = false;

            rainCam.SetActive(false);
            rainAL.enabled = false;

            tornadoCam.SetActive(false);
            tornadoAL.enabled = false;

            healCam.SetActive(false);
            healAL.enabled = false;
        }
        if (Input.GetKeyDown(KeyCode.Alpha4)) //Vine
        {
            instructionsText.color = Color.black;

            fireworksCam.SetActive(false);
            fireworkAL.enabled = false;

            dissolveCam.SetActive(false);
            dissolveAL.enabled = false;

            rippleCam.SetActive(false);
            rippleAL.enabled = false;

            vineCam.SetActive(true);
            vineAL.enabled = true;

            bubblesCam.SetActive(false);
            bubblesAL.enabled = false;

            sparkCam.SetActive(false);
            sparkAL.enabled = false;

            rainCam.SetActive(false);
            rainAL.enabled = false;

            tornadoCam.SetActive(false);
            tornadoAL.enabled = false;

            healCam.SetActive(false);
            healAL.enabled = false;
        }
        if (Input.GetKeyDown(KeyCode.Alpha5)) //Bubbles
        {
            instructionsText.color = Color.black;

            fireworksCam.SetActive(false);
            fireworkAL.enabled = false;

            dissolveCam.SetActive(false);
            dissolveAL.enabled = false;

            rippleCam.SetActive(false);
            rippleAL.enabled = false;

            vineCam.SetActive(false);
            vineAL.enabled = false;

            bubblesCam.SetActive(true);
            bubblesAL.enabled = true;

            sparkCam.SetActive(false);
            sparkAL.enabled = false;

            rainCam.SetActive(false);
            rainAL.enabled = false;

            tornadoCam.SetActive(false);
            tornadoAL.enabled = false;

            healCam.SetActive(false);
            healAL.enabled = false;
        }
        if (Input.GetKeyDown(KeyCode.Alpha6)) //Sparks
        {
            instructionsText.color = Color.white;

            fireworksCam.SetActive(false);
            fireworkAL.enabled = false;

            dissolveCam.SetActive(false);
            dissolveAL.enabled = false;

            rippleCam.SetActive(false);
            rippleAL.enabled = false;

            vineCam.SetActive(false);
            vineAL.enabled = false;

            bubblesCam.SetActive(false);
            bubblesAL.enabled = false;

            sparkCam.SetActive(true);
            sparkAL.enabled = true;

            rainCam.SetActive(false);
            rainAL.enabled = false;

            tornadoCam.SetActive(false);
            tornadoAL.enabled = false;

            healCam.SetActive(false);
            healAL.enabled = false;
        }
        if (Input.GetKeyDown(KeyCode.Alpha7)) //Rain
        {
            instructionsText.color = Color.black;

            fireworksCam.SetActive(false);
            fireworkAL.enabled = false;

            dissolveCam.SetActive(false);
            dissolveAL.enabled = false;

            rippleCam.SetActive(false);
            rippleAL.enabled = false;

            vineCam.SetActive(false);
            vineAL.enabled = false;

            bubblesCam.SetActive(false);
            bubblesAL.enabled = false;

            sparkCam.SetActive(false);
            sparkAL.enabled = false;

            rainCam.SetActive(true);
            rainAL.enabled = true;

            tornadoCam.SetActive(false);
            tornadoAL.enabled = false;

            healCam.SetActive(false);
            healAL.enabled = false;
        }
        if (Input.GetKeyDown(KeyCode.Alpha8)) //tornado
        {
            instructionsText.color = Color.white;

            fireworksCam.SetActive(false);
            fireworkAL.enabled = false;

            dissolveCam.SetActive(false);
            dissolveAL.enabled = false;

            rippleCam.SetActive(false);
            rippleAL.enabled = false;

            vineCam.SetActive(false);
            vineAL.enabled = false;

            bubblesCam.SetActive(false);
            bubblesAL.enabled = false;

            sparkCam.SetActive(false);
            sparkAL.enabled = false;

            rainCam.SetActive(false);
            rainAL.enabled = false;

            tornadoCam.SetActive(true);
            tornadoAL.enabled = true;

            healCam.SetActive(false);
            healAL.enabled = false;
        }

        if (Input.GetKeyDown(KeyCode.Alpha9))
        {
            healCanvas.SetActive(true);

            healCam.SetActive(true);
            healAL.enabled = true;

            fireworksCam.SetActive(false);
            fireworkAL.enabled = false;

            dissolveCam.SetActive(false);
            dissolveAL.enabled = false;

            rippleCam.SetActive(false);
            rippleAL.enabled = false;

            vineCam.SetActive(false);
            vineAL.enabled = false;

            bubblesCam.SetActive(false);
            bubblesAL.enabled = false;

            sparkCam.SetActive(false);
            sparkAL.enabled = false;

            rainCam.SetActive(false);
            rainAL.enabled = false;
        }
        #endregion

        #region Quit Game with ESC
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            #if UNITY_EDITOR
            EditorApplication.ExitPlaymode();
            #endif
            Application.Quit();
        }
        #endregion
    }
}
