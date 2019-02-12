//
//  InterfaceController.swift
//  LunarPhaseSwift WatchKit Extension
//
//  Created by James Alan Bush on 2/12/19.
//  Copyright © 2019 The Life of a Demoniac. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController, WKCrownDelegate {
    
    @IBOutlet var sceneView: WKInterfaceSCNScene!
    
    var brownNode = SCNNode(geometry: SCNSphere(radius: 5))
    var cameraNode = SCNNode()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        crownSequencer.delegate = self
        addScene()
        
    }
    
    func addScene() {
        let scene = SCNScene()
        
        let lensNode = SCNNode()
        lensNode.camera = SCNCamera()
        lensNode.position = SCNVector3(x: 0, y: 0, z: 10)
        scene.rootNode.addChildNode(lensNode)
        
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = SCNLight.LightType.omni
        lightNode.position = SCNVector3(x: 0, y: 0, z: 15)
        cameraNode.addChildNode(lightNode)
        scene.rootNode.addChildNode(cameraNode)
        
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = SCNLight.LightType.ambient
        ambientLightNode.light!.color = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0) // color of the moon with earth's shadow 
        scene.rootNode.addChildNode(ambientLightNode)
        
        brownNode.position = SCNVector3(x: 0, y: 0, z: 0)
        
        //texture
        let material3 = SCNMaterial()
        material3.diffuse.contents = UIImage(named: "moon-diffuse-copy.jpg");
        brownNode.geometry?.firstMaterial = material3
        
        scene.rootNode.addChildNode(brownNode)
        
        sceneView.scene = scene
        
        let lunarPhase = LunarPhase()
        let degrees:CGFloat = CGFloat(lunarPhase.phase(for: Date()))
        cameraNode.runAction(SCNAction.rotateBy(x: 0, y: degrees, z: 0, duration: 1.0), completionHandler: {} )
        
//        let snapshot = self.sceneView.snapshot()
    }
    
    func crownDidRotate(_ crownSequencer: WKCrownSequencer?, rotationalDelta: Double) {
        
        let d:CGFloat = CGFloat(rotationalDelta)
        cameraNode.runAction(SCNAction.rotateBy(x: 0, y: d, z: 0, duration: 1.0), completionHandler: {} )
        
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
    
}
